#!/usr/bin/env python

import logging
from logging.handlers import RotatingFileHandler
import datetime
from flask import Flask, jsonify, request

import dal

app = Flask(__name__)
app.config.from_object('serverconfig')
# app.config['JSON_AS_ASCII'] = False
# app.config.from_object('config')


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

    return jsonify(dal.DemandList(facility, sdate, edate).to_dict())


@app.route('/demands', methods=['POST'])
def post_demand():
    data = request.get_json()
    if data:
        d = dal.Demand()
        i = d.from_dict(data)
        return jsonify({'demands': i})
    else:
        return '', 400


@app.route('/demands/<int:document_id>', methods=['GET'])
def get_demand(document_id):
    return jsonify(dal.Demand(document_id).to_dict())

#Flask-UUID <uuid:doc_id>
#@app.route('/demands/<string:document_name>', methods=['GET'])
#def get_demand1(document_name):
#    return jsonify(document_name)


@app.route('/demands/<int:document_id>/body', methods=['PATCH'])
def patch_demand_body(document_id):
    data = request.get_json()
    if data:
        d = dal.Demand().update_body(document_id, data)
        return jsonify(str(document_id))
    else:
        return '', 400


@app.route('/demands/<int:document_id>/fsmt', methods=['PUT'])
def patch_demand_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Demand()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/demands/<int:document_id>', methods=['DELETE'])
def del_demand(document_id):
    dal.Demand().delete_document(document_id)
    return '', 204


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

    return jsonify(dal.ReserveList(facility, sdate, edate).to_dict())


@app.route('/reserves', methods=['POST'])
def post_reserve():
    data = request.get_json()
    if data:
        d = dal.Reserve()
        i = d.from_dict(data)
        return jsonify({'reserves': i})
    else:
        return '', 400


@app.route('/reserves/<int:document_id>', methods=['GET'])
def get_reserve(document_id):
    return jsonify(dal.Reserve(document_id).to_dict())


@app.route('/reserves/<int:document_id>/fsmt', methods=['PUT'])
def patch_reserve_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Reserve()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/reserve/<int:document_id>', methods=['DELETE'])
def del_reserve(document_id):
    dal.Reserve().delete_document(document_id)
    return '', 204


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

    return jsonify(dal.PicklistList(facility, sdate, edate).to_dict())


@app.route('/picklists', methods=['POST'])
def post_picklist():
    data = request.get_json()
    if data:
        d = dal.Picklist()
        i = d.from_dict(data)
        return jsonify({'picklists': i})
    else:
        return '', 400


@app.route('/picklists/<int:document_id>', methods=['GET'])
def get_picklist(document_id):
    return jsonify(dal.Picklist(document_id).to_dict())


@app.route('/picklists/<int:document_id>/fsmt', methods=['PUT'])
def patch_picklist_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Picklist()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/picklists/<int:document_id>', methods=['DELETE'])
def del_picklist(document_id):
    dal.Picklist().delete_document(document_id)
    return '', 204


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

    return jsonify(dal.IssueList(facility, sdate, edate).to_dict())


@app.route('/issues', methods=['POST'])
def post_issue():
    data = request.get_json()
    if data:
        d = dal.Issue()
        i = d.from_dict(data)
        return jsonify({'issues': i})
    else:
        return '', 400


@app.route('/issues/<int:document_id>', methods=['GET'])
def get_issue(document_id):
    return jsonify(dal.Issue(document_id).to_dict())


@app.route('/issues/<int:document_id>/fsmt', methods=['PUT'])
def patch_issue_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Issue()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/issues/<int:document_id>', methods=['DELETE'])
def del_issue(document_id):
    dal.Issue().delete_document(document_id)
    return '', 204


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

    return jsonify(dal.DespatchList(facility, sdate, edate).to_dict())


@app.route('/despatches', methods=['POST'])
def post_despatch():
    data = request.get_json()
    if data:
        d = dal.Despatch()
        i = d.from_dict(data)
        return jsonify({'despatches': i})
    else:
        return '', 400


@app.route('/despatches/<int:document_id>', methods=['GET'])
def get_despatch(document_id):
    return jsonify(dal.Despatch(document_id).to_dict())


@app.route('/despatches/<int:document_id>/fsmt', methods=['PUT'])
def patch_despatch_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Despatch()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/despatches/<int:document_id>', methods=['DELETE'])
def del_despatch(document_id):
    dal.Despatch().delete_document(document_id)
    return '', 204


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

    return jsonify(dal.ReboundList(facility, sdate, edate).to_dict())


@app.route('/rebounds', methods=['POST'])
def post_rebound():
    data = request.get_json()
    if data:
        d = dal.Rebound()
        i = d.from_dict(data)
        return jsonify({'rebounds': i})
    else:
        return '', 400


@app.route('/rebounds/<int:document_id>', methods=['GET'])
def get_rebound(document_id):
    return jsonify(dal.Rebound(document_id).to_dict())


@app.route('/rebounds/<int:document_id>/fsmt', methods=['PUT'])
def patch_rebound_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Rebound()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/rebounds/<int:document_id>', methods=['DELETE'])
def del_rebound(document_id):
    dal.Rebound().delete_document(document_id)
    return '', 204


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

    return jsonify(dal.DeliveryList(facility, sdate, edate).to_dict())


@app.route('/deliveries', methods=['POST'])
def post_delivery():
    data = request.get_json()
    if data:
        d = dal.Delivery()
        i = d.from_dict(data)
        return jsonify({'deliveries': i})
    else:
        return '', 400


@app.route('/deliveries/<int:document_id>', methods=['GET'])
def get_delivery(document_id):
    return jsonify(dal.Delivery(document_id).to_dict())


@app.route('/deliveries/<int:document_id>/fsmt', methods=['PUT'])
def patch_delivery_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Delivery()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/deliveries/<int:document_id>', methods=['DELETE'])
def del_delivery(document_id):
    dal.Delivery().delete_document(document_id)
    return '', 204


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

    return jsonify(dal.ReceiptList(facility, sdate, edate).to_dict())


@app.route('/receipts', methods=['POST'])
def post_receipt():
    data = request.get_json()
    if data:
        d = dal.Receipt()
        i = d.from_dict(data)
        return jsonify({'receipts': i})
    else:
        return '', 400


@app.route('/receipts/<int:document_id>', methods=['GET'])
def get_receipt(document_id):
    return jsonify(dal.Receipt(document_id).to_dict())


@app.route('/receipts/<int:document_id>/fsmt', methods=['PUT'])
def patch_receipt_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Receipt()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/receipts/<int:document_id>', methods=['DELETE'])
def del_receipt(document_id):
    dal.Receipt().delete_document(document_id)
    return '', 204


@app.route('/cutoffs', methods=['GET'])
def get_cutoffs():
    return '', 405


@app.route('/cutoffs/<int:document_id>', methods=['GET'])
def get_cutoff(document_id):
    #return 'cutoff {0}'.format(document_id)
    return '', 405


@app.route('/cutoffs/<int:document_id>/fsmt', methods=['PUT'])
def patch_cutoff_fsmt(document_id):
    return '', 405


@app.route('/cutoffs/<int:document_id>', methods=['DELETE'])
def del_cutoff(document_id):
    # dal.del_document('cutoff', document_id)
    return '', 405


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

    return jsonify(dal.StocktakeList(facility, sdate, edate).to_dict())


@app.route('/stocktakes', methods=['POST'])
def post_stocktake():
    data = request.get_json()
    if data:
        d = dal.Stocktake()
        i = d.from_dict(data)
        return jsonify({'stocktakes': i})
    else:
        return '', 400


@app.route('/stocktakes/<int:document_id>', methods=['GET'])
def get_stocktake(document_id):
    return jsonify(dal.Stocktake(document_id).to_dict())


@app.route('/stocktakes/<int:document_id>/fsmt', methods=['PUT'])
def patch_stocktake_fsmt(document_id):
    data = request.get_json()
    if data:
        d = dal.Stocktake()
        if data['curr_fsmt'] == 'COMMITTED':
            d.do_commit(document_id)
        elif data['curr_fsmt'] == 'DECOMMITTED':
            d.do_decommit(document_id)
        else:
            return 'incorrect fsmt', 400
    return jsonify({"status": data['curr_fsmt']})


@app.route('/stocktakes/<int:document_id>', methods=['DELETE'])
def del_stocktake(document_id):
    dal.Stocktake().delete_document(document_id)
    return '', 204


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
