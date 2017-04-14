from flask import Flask, abort


app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'


@app.route('/demands', methods=['GET'])
def get_demands():
    return 'demands'


@app.route('/demands/<int:document_id>', methods=['GET'])
def get_demand(document_id):
    return 'demand id: {0}'.format(document_id)


@app.route('/reserves', methods=['GET'])
def get_reserves():
    return 'reserves'


@app.route('/reserves/<int:document_id>', methods=['GET'])
def get_reserve(document_id):
    return 'reserve id: {0}'.format(document_id)


@app.route('/picklists', methods=['GET'])
def get_picklists():
    return 'picklists'


@app.route('/picklists/<int:document_id>', methods=['GET'])
def get_picklist(document_id):
    return 'picklist id: {0}'.format(document_id)


@app.route('/issues', methods=['GET'])
def get_issues():
    return 'issues'


@app.route('/issues/<int:document_id>', methods=['GET'])
def get_issue(document_id):
    return 'issue id: {0}'.format(document_id)


@app.route('/despatches', methods=['GET'])
def get_despatches():
    return 'despatches'


@app.route('/despatches/<int:document_id>', methods=['GET'])
def get_despatch(document_id):
    return 'despatch id: {0}'.format(document_id)


@app.route('/rebounds', methods=['GET'])
def get_rebounds():
    return 'rebounds'


@app.route('/rebounds/<int:document_id>', methods=['GET'])
def get_rebound(document_id):
    return 'rebound id: {0}'.format(document_id)


@app.route('/deliveries', methods=['GET'])
def get_deliveries():
    return 'deliveries'


@app.route('/deliveries/<int:document_id>', methods=['GET'])
def get_delivery(document_id):
    return 'delivery id: {0}'.format(document_id)


@app.route('/receipts', methods=['GET'])
def get_receipts():
    return 'receipts'


@app.route('/receipts/<int:document_id>', methods=['GET'])
def get_receipt(document_id):
    return 'receipt id: {0}'.format(document_id)


@app.route('/cutoffs', methods=['GET'])
def get_cutoffs():
    return 'cutoffs'


@app.route('/cutoffs/<int:document_id>', methods=['GET'])
def get_cutoff(document_id):
    return 'cutoff id: {0}'.format(document_id)


@app.route('/stocktakes', methods=['GET'])
def get_stocktakes():
    return 'stocktakes'


@app.route('/stocktakes/<int:document_id>', methods=['GET'])
def get_stocktake(document_id):
    return 'stocktake id: {0}'.format(document_id)


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
