#!/usr/bin/env python

import logging
from logging.handlers import RotatingFileHandler

from flask import Flask, jsonify

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
    return 'Hello, World!'


@app.route('/demands', methods=['GET'])
def get_demands():
    return jsonify(dal.DemandList().to_dict())


@app.route('/demands', methods=['PUT'])
def put_demand():
    return jsonify({'demands': 'new demand put'})


@app.route('/demands/<int:document_id>', methods=['GET'])
def get_demand(document_id):
    return jsonify(dal.Demand(document_id).to_dict())


@app.route('/demands/<int:document_id>', methods=['PATCH'])
def patch_demand(document_id):
    return jsonify(str(document_id))


@app.route('/demands/<int:document_id>/commit', methods=['PATCH'])
def patch_demand_commit(document_id):
    dal.Demand().do_commit(document_id=document_id, apprise=True)
    return jsonify("status", "commited")


@app.route('/demands/<int:document_id>', methods=['DELETE'])
def del_demand(document_id):
    dal.Demand().delete_document(document_id)
    return '', 204


@app.route('/reserves', methods=['GET'])
def get_reserves():
    return 'reserves'


@app.route('/reserves/<int:document_id>', methods=['GET'])
def get_reserve(document_id):
    return jsonify(dal.Reserve(document_id).to_dict())


@app.route('/reserve/<int:document_id>', methods=['DELETE'])
def del_reserve(document_id):
    dal.Reserve().delete_document(document_id)
    return '', 204


@app.route('/picklists', methods=['GET'])
def get_picklists():
    return 'picklists'


@app.route('/picklists/<int:document_id>', methods=['GET'])
def get_picklist(document_id):
    return jsonify(dal.Picklist(document_id).to_dict())


@app.route('/picklists/<int:document_id>', methods=['DELETE'])
def del_picklist(document_id):
    dal.Picklist().delete_document(document_id)
    return '', 204


@app.route('/issues', methods=['GET'])
def get_issues():
    return 'issues'


@app.route('/issues/<int:document_id>', methods=['GET'])
def get_issue(document_id):
    return jsonify(dal.Issue(document_id).to_dict())


@app.route('/issues/<int:document_id>', methods=['DELETE'])
def del_issue(document_id):
    dal.Issue().delete_document(document_id)
    return '', 204


@app.route('/despatches', methods=['GET'])
def get_despatches():
    return 'despatches'


@app.route('/despatches/<int:document_id>', methods=['GET'])
def get_despatch(document_id):
    return jsonify(dal.Despatch(document_id).to_dict())


@app.route('/despatches/<int:document_id>', methods=['DELETE'])
def del_despatch(document_id):
    dal.Despatch().delete_document(document_id)
    return '', 204


@app.route('/rebounds', methods=['GET'])
def get_rebounds():
    return 'rebounds'


@app.route('/rebounds/<int:document_id>', methods=['GET'])
def get_rebound(document_id):
    return jsonify(dal.Rebound(document_id).to_dict())


@app.route('/rebounds/<int:document_id>', methods=['DELETE'])
def del_rebound(document_id):
    dal.Rebound().delete_document(document_id)
    return '', 204


@app.route('/deliveries', methods=['GET'])
def get_deliveries():
    return 'deliveries'


@app.route('/deliveries/<int:document_id>', methods=['GET'])
def get_delivery(document_id):
    return jsonify(dal.Delivery(document_id).to_dict())


@app.route('/deliveries/<int:document_id>', methods=['DELETE'])
def del_delivery(document_id):
    dal.Delivery().delete_document(document_id)
    return '', 204


@app.route('/receipts', methods=['GET'])
def get_receipts():
    return 'receipts'


@app.route('/receipts/<int:document_id>', methods=['GET'])
def get_receipt(document_id):
    return jsonify(dal.Receipt(document_id).to_dict())


@app.route('/receipts/<int:document_id>', methods=['DELETE'])
def del_receipt(document_id):
    dal.Receipt().delete_document(document_id)
    return '', 204


@app.route('/cutoffs', methods=['GET'])
def get_cutoffs():
    return 'cutoffs'


@app.route('/cutoffs/<int:document_id>', methods=['GET'])
def get_cutoff(document_id):
    return 'cutoff {0}'.format(document_id)


@app.route('/cutoffs/<int:document_id>', methods=['DELETE'])
def del_cutoff(document_id):
    # dal.del_document('cutoff', document_id)
    return '', 405


@app.route('/stocktakes', methods=['GET'])
def get_stocktakes():
    return 'stocktakes'


@app.route('/stocktakes/<int:document_id>', methods=['GET'])
def get_stocktake(document_id):
    return jsonify(dal.Stocktake(document_id).to_dict())


@app.route('/stocktakes/<int:document_id>', methods=['DELETE'])
def del_stocktake(document_id):
    dal.Stocktake().delete_document(document_id)
    return '', 204


@app.route('/stockcards', methods=['GET'])
def get_stockcards():
    return 'stockcards'


@app.route('/stockcards/<int:document_id>', methods=['GET'])
def get_stockcard(document_id):
    return 'stockcard id: {0}'.format(document_id)


@app.route('/balance', methods=['GET'])
def get_balance():
    return 'balance'


if __name__ == '__main__':
    app.run(debug=True)
