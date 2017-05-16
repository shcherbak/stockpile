#!/usr/bin/env python

from flask import Flask, abort, jsonify
from dal2 import DataAccessLayer


app = Flask(__name__)
dal = DataAccessLayer()
#app.config.from_object('config')


@app.route('/')
def hello_world():
    return 'Hello, World!'


@app.route('/demands', methods=['GET'])
def get_demands():
    return jsonify({'demands': 'demands'})


@app.route('/demands', methods=['PUT'])
def put_demand():
    return jsonify({'demands': 'new demand put'})


@app.route('/demands/<int:document_id>', methods=['GET'])
def get_demand(document_id):
    return jsonify(dal.get_document('demand', document_id))


@app.route('/demands/<int:document_id>', methods=['PATCH'])
def patch_demand(document_id):
    return jsonify(str(document_id))


@app.route('/demands/<int:document_id>', methods=['DELETE'])
def del_demand(document_id):
    dal.del_document('demand', document_id)
    return ('', 204)


@app.route('/reserves', methods=['GET'])
def get_reserves():
    return 'reserves'


@app.route('/reserves/<int:document_id>', methods=['GET'])
def get_reserve(document_id):
    return jsonify(dal.get_document('reserve', document_id))


@app.route('/reserve/<int:document_id>', methods=['DELETE'])
def del_reserve(document_id):
    dal.del_document('reserve', document_id)
    return ('', 204)


@app.route('/picklists', methods=['GET'])
def get_picklists():
    return 'picklists'


@app.route('/picklists/<int:document_id>', methods=['GET'])
def get_picklist(document_id):
    return jsonify(dal.get_document('picklist', document_id))


@app.route('/picklists/<int:document_id>', methods=['DELETE'])
def del_picklist(document_id):
    dal.del_document('picklist', document_id)
    return ('', 204)


@app.route('/issues', methods=['GET'])
def get_issues():
    return 'issues'


@app.route('/issues/<int:document_id>', methods=['GET'])
def get_issue(document_id):
    return jsonify(dal.get_document('issue', document_id))


@app.route('/issues/<int:document_id>', methods=['DELETE'])
def del_issue(document_id):
    dal.del_document('issue', document_id)
    return ('', 204)


@app.route('/despatches', methods=['GET'])
def get_despatches():
    return 'despatches'


@app.route('/despatches/<int:document_id>', methods=['GET'])
def get_despatch(document_id):
    return jsonify(dal.get_document('despatch', document_id))


@app.route('/despatches/<int:document_id>', methods=['DELETE'])
def del_despatch(document_id):
    dal.del_document('despatch', document_id)
    return ('', 204)


@app.route('/rebounds', methods=['GET'])
def get_rebounds():
    return 'rebounds'


@app.route('/rebounds/<int:document_id>', methods=['GET'])
def get_rebound(document_id):
    return jsonify(dal.get_document('rebound', document_id))


@app.route('/rebounds/<int:document_id>', methods=['DELETE'])
def del_rebound(document_id):
    dal.del_document('rebound', document_id)
    return ('', 204)


@app.route('/deliveries', methods=['GET'])
def get_deliveries():
    return 'deliveries'


@app.route('/deliveries/<int:document_id>', methods=['GET'])
def get_delivery(document_id):
    return jsonify(dal.get_document('delivery', document_id))


@app.route('/deliveries/<int:document_id>', methods=['DELETE'])
def del_delivery(document_id):
    dal.del_document('delivery', document_id)
    return ('', 204)


@app.route('/receipts', methods=['GET'])
def get_receipts():
    return 'receipts'


@app.route('/receipts/<int:document_id>', methods=['GET'])
def get_receipt(document_id):
    return jsonify(dal.get_document('receipt', document_id))


@app.route('/receipts/<int:document_id>', methods=['DELETE'])
def del_receipt(document_id):
    dal.del_document('receipt', document_id)
    return ('', 204)


@app.route('/cutoffs', methods=['GET'])
def get_cutoffs():
    return 'cutoffs'


@app.route('/cutoffs/<int:document_id>', methods=['GET'])
def get_cutoff(document_id):
    return jsonify(dal.get_document('cutoff', document_id))


@app.route('/cutoffs/<int:document_id>', methods=['DELETE'])
def del_cutoff(document_id):
    dal.del_document('cutoff', document_id)
    return ('', 204)


@app.route('/stocktakes', methods=['GET'])
def get_stocktakes():
    return 'stocktakes'


@app.route('/stocktakes/<int:document_id>', methods=['GET'])
def get_stocktake(document_id):
    return jsonify(dal.get_document('stocktake', document_id))


@app.route('/stocktakes/<int:document_id>', methods=['DELETE'])
def del_stocktake(document_id):
    dal.del_document('stocktake', document_id)
    return ('', 204)


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
