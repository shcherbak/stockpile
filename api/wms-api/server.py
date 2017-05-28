#!/usr/bin/env python

import datetime
import logging
from logging.handlers import RotatingFileHandler
import json

from flask import Flask, jsonify, request

import dao
from inputs import Inputs
from validators import JsonSchema

app = Flask(__name__)
app.config.from_object('serverconfig')
# app.config['JSON_AS_ASCII'] = False
# app.config.from_object('config')

schema = json.loads(open("schema/warehouse-fsmt-schema.json").read())
schema1 = {
        "$schema": "http://json-schema.org/draft-04/schema#",
        "properties": {
        "curr_fsmt": {
            "type": "string"
        }
    },
    "required": [
        "curr_fsmt"
    ],
    "type": "object"
    }



class JsonInputs(Inputs):
    json = [JsonSchema(schema=schema)]


class JsonInputsMsg(Inputs):
    json = [JsonSchema(schema=schema, message='JSON data did not validate.')]

#Flask-UUID <uuid:doc_id>
#@app.route('/demands/<string:document_name>', methods=['GET'])
#def get_demand1(document_name):
#    return jsonify(document_name)

# ref: https://gist.github.com/ibeex/3257877
formatter = logging.Formatter(
    "[%(asctime)s] {%(pathname)s:%(lineno)d} %(levelname)s - %(message)s")
handler = RotatingFileHandler(app.config['LOG_FILENAME'],
                              maxBytes=10000000,
                              backupCount=5)
handler.setLevel(logging.DEBUG)
handler.setFormatter(formatter)
app.logger.addHandler(handler)

# Output the access logs to the same file
log = logging.getLogger('werkzeug')
log.setLevel(logging.DEBUG)
log.addHandler(handler)


@app.errorhandler(404)
def page_not_found(e):
    return "404 not found", 404


@app.route('/')
def hello_world():
    return 'Stockpile WMS-API v1'


@app.route('/demands', methods=['GET'])
def get_demands():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.DemandList(facility, sdate, edate).to_dict())


@app.route('/demands', methods=['POST'])
def post_demand():
    data = request.get_json()
    if data:
        d = dao.Demand()
        d.from_dict(data)
        i = d.init()
        return jsonify({'demands': i})
    else:
        return '', 400


@app.route('/demands/<int:document_id>', methods=['GET'])
def get_demand(document_id):
    document = dao.Demand(document_id)
    return jsonify(document.to_dict())


@app.route('/demands/<int:document_id>', methods=['DELETE'])
def del_demand(document_id):
    dao.Demand().delete(document_id)
    return '', 204


@app.route('/demands/<int:document_id>/body', methods=['PATCH'])
def patch_demand_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Demand()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/demands/<int:document_id>/fsmt', methods=['PUT'])
def patch_demand_fsmt(document_id):
    inputs = JsonInputs(request)
    #print(request)
    #print(inputs)
    #print (inputs.validate())
    #return '', 200
    if not inputs.validate():
        return jsonify(success=False, errors=inputs.errors), 400
    else:
        data = request.get_json()
        d = dao.Demand()

        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400

        return jsonify({"status": data['curr_fsmt']})


@app.route('/reserves', methods=['GET'])
def get_reserves():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.ReserveList(facility, sdate, edate).to_dict())


@app.route('/reserves', methods=['POST'])
def post_reserve():
    data = request.get_json()
    if data:
        d = dao.Reserve()
        d.from_dict(data)
        i = d.init()
        return jsonify({'reserves': i})
    else:
        return '', 400


@app.route('/reserves/<int:document_id>', methods=['GET'])
def get_reserve(document_id):
    document = dao.Reserve(document_id)
    return jsonify(document.to_dict())


@app.route('/reserve/<int:document_id>', methods=['DELETE'])
def del_reserve(document_id):
    dao.Reserve().delete(document_id)
    return '', 204


@app.route('/reserve/<int:document_id>/body', methods=['PATCH'])
def patch_reserve_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Reserve()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/reserves/<int:document_id>/fsmt', methods=['PUT'])
def patch_reserve_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Reserve()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/picklists', methods=['GET'])
def get_picklists():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.PicklistList(facility, sdate, edate).to_dict())


@app.route('/picklists', methods=['POST'])
def post_picklist():
    data = request.get_json()
    if data:
        d = dao.Picklist()
        d.from_dict(data)
        i = d.init()
        return jsonify({'picklists': i})
    else:
        return '', 400


@app.route('/picklists/<int:document_id>', methods=['GET'])
def get_picklist(document_id):
    document = dao.Picklist(document_id)
    return jsonify(document.to_dict())


@app.route('/picklists/<int:document_id>', methods=['DELETE'])
def del_picklist(document_id):
    dao.Picklist().delete(document_id)
    return '', 204


@app.route('/picklists/<int:document_id>/body', methods=['PATCH'])
def patch_picklists_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Picklist()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/picklists/<int:document_id>/fsmt', methods=['PUT'])
def patch_picklist_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Picklist()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/issues', methods=['GET'])
def get_issues():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.IssueList(facility, sdate, edate).to_dict())


@app.route('/issues', methods=['POST'])
def post_issue():
    data = request.get_json()
    if data:
        d = dao.Issue()
        d.from_dict(data)
        i = d.init()
        return jsonify({'issues': i})
    else:
        return '', 400


@app.route('/issues/<int:document_id>', methods=['GET'])
def get_issue(document_id):
    document = dao.Issue(document_id)
    return jsonify(document.to_dict())


@app.route('/issues/<int:document_id>', methods=['DELETE'])
def del_issue(document_id):
    dao.Issue().delete(document_id)
    return '', 204


@app.route('/issues/<int:document_id>/body', methods=['PATCH'])
def patch_issues_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Issue()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/issues/<int:document_id>/fsmt', methods=['PUT'])
def patch_issue_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Issue()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/despatches', methods=['GET'])
def get_despatches():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.DespatchList(facility, sdate, edate).to_dict())


@app.route('/despatches', methods=['POST'])
def post_despatch():
    data = request.get_json()
    if data:
        d = dao.Despatch()
        d.from_dict(data)
        i = d.init()
        return jsonify({'despatches': i})
    else:
        return '', 400


@app.route('/despatches/<int:document_id>', methods=['GET'])
def get_despatch(document_id):
    document = dao.Despatch(document_id)
    return jsonify(document.to_dict())


@app.route('/despatches/<int:document_id>', methods=['DELETE'])
def del_despatch(document_id):
    dao.Despatch().delete(document_id)
    return '', 204


@app.route('/despatches/<int:document_id>/body', methods=['PATCH'])
def patch_despatches_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Despatch()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/despatches/<int:document_id>/fsmt', methods=['PUT'])
def patch_despatch_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Despatch()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/rebounds', methods=['GET'])
def get_rebounds():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.ReboundList(facility, sdate, edate).to_dict())


@app.route('/rebounds', methods=['POST'])
def post_rebound():
    data = request.get_json()
    if data:
        d = dao.Rebound()
        d.from_dict(data)
        i = d.init()
        return jsonify({'rebounds': i})
    else:
        return '', 400


@app.route('/rebounds/<int:document_id>', methods=['GET'])
def get_rebound(document_id):
    document = dao.Rebound(document_id)
    return jsonify(document.to_dict())


@app.route('/rebounds/<int:document_id>', methods=['DELETE'])
def del_rebound(document_id):
    dao.Rebound().delete(document_id)
    return '', 204


@app.route('/rebounds/<int:document_id>/body', methods=['PATCH'])
def patch_rebounds_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Rebound()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/rebounds/<int:document_id>/fsmt', methods=['PUT'])
def patch_rebound_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Rebound()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/deliveries', methods=['GET'])
def get_deliveries():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.DeliveryList(facility, sdate, edate).to_dict())


@app.route('/deliveries', methods=['POST'])
def post_delivery():
    data = request.get_json()
    if data:
        d = dao.Delivery()
        d.from_dict(data)
        i = d.init()
        return jsonify({'deliveries': i})
    else:
        return '', 400


@app.route('/deliveries/<int:document_id>', methods=['GET'])
def get_delivery(document_id):
    document = dao.Delivery(document_id)
    return jsonify(document.to_dict())


@app.route('/deliveries/<int:document_id>', methods=['DELETE'])
def del_delivery(document_id):
    dao.Delivery().delete(document_id)
    return '', 204


@app.route('/deliveries/<int:document_id>/body', methods=['PATCH'])
def patch_deliveries_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Delivery()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/deliveries/<int:document_id>/fsmt', methods=['PUT'])
def patch_delivery_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Delivery()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/receipts', methods=['GET'])
def get_receipts():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.ReceiptList(facility, sdate, edate).to_dict())


@app.route('/receipts', methods=['POST'])
def post_receipt():
    data = request.get_json()
    if data:
        d = dao.Receipt()
        d.from_dict(data)
        i = d.init()
        return jsonify({'receipts': i})
    else:
        return '', 400


@app.route('/receipts/<int:document_id>', methods=['GET'])
def get_receipt(document_id):
    document = dao.Receipt(document_id)
    return jsonify(document.to_dict())


@app.route('/receipts/<int:document_id>', methods=['DELETE'])
def del_receipt(document_id):
    dao.Receipt().delete(document_id)
    return '', 204


@app.route('/receipts/<int:document_id>/body', methods=['PATCH'])
def patch_receipts_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Receipt()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/receipts/<int:document_id>/fsmt', methods=['PUT'])
def patch_receipt_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Receipt()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/cutoffs', methods=['GET'])
def get_cutoffs():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

        return jsonify(dao.CutoffList(facility, sdate, edate).to_dict())


@app.route('/cutoffs', methods=['POST'])
def post_cutoff():
    data = request.get_json()
    if data:
        d = dao.Cutoff()
        d.from_dict(data)
        i = d.init()
        return jsonify({'cutoffs': i})
    else:
        return '', 400


@app.route('/cutoffs/<int:document_id>', methods=['GET'])
def get_cutoff(document_id):
    document = dao.Cutoff(document_id)
    return jsonify(document.to_dict())


@app.route('/cutoffs/<int:document_id>', methods=['DELETE'])
def del_cutoff(document_id):
    dao.Cutoff().delete(document_id)
    return '', 204


@app.route('/cutoffs/<int:document_id>/fsmt', methods=['PUT'])
def patch_cutoffs_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Cutoff()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/stocktakes', methods=['GET'])
def get_stocktakes():
    req_sdate = request.args.get('sdate')
    req_edate = request.args.get('edate')
    facility = request.args.get('facility')

    if req_sdate:
        sdate = datetime.datetime.strptime(req_sdate, "%Y-%m-%d").date()
    else:
        sdate = datetime.datetime.now().date() - datetime.timedelta(days=1000)

    if req_edate:
        edate = datetime.datetime.strptime(req_edate, "%Y-%m-%d").date()
    else:
        edate = datetime.datetime.now().date() + datetime.timedelta(days=1)

    if not facility:
        facility = 'A1'

    return jsonify(dao.StocktakeList(facility, sdate, edate).to_dict())


@app.route('/stocktakes', methods=['POST'])
def post_stocktake():
    data = request.get_json()
    if data:
        d = dao.Stocktake()
        d.from_dict(data)
        i = d.init()
        return jsonify({'stocktakes': i})
    else:
        return '', 400


@app.route('/stocktakes/<int:document_id>', methods=['GET'])
def get_stocktake(document_id):
    document = dao.Stocktake(document_id)
    return jsonify(document.to_dict())


@app.route('/stocktakes/<int:document_id>', methods=['DELETE'])
def del_stocktake(document_id):
    dao.Stocktake().delete(document_id)
    return '', 204


@app.route('/stocktakes/<int:document_id>/body', methods=['PATCH'])
def patch_stocktakes_body(document_id):
    data = request.get_json()
    if data:
        d = dao.Stocktake()
        d.from_dict(data)
        d.reinit(document_id)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/stocktakes/<int:document_id>/fsmt', methods=['PUT'])
def patch_stocktake_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dao.Stocktake()
        if data['curr_fsmt'] == 'COMMITTED':
            d.commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/stockcards', methods=['GET'])
def get_stockcards():
    return '', 405


@app.route('/stockcards/<int:document_id>', methods=['GET'])
def get_stockcard(document_id):
    #return 'stockcard id: {0}'.format(document_id)
    return '', 405


@app.route('/balance', methods=['GET'])
def get_balance():
    return '', 405


if __name__ == '__main__':
    app.run(debug=True)
