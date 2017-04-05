#!/bin/bash

# select schema_name from information_schema.schemata;

sqlacodegen --schema adjustmentcredit --outfile ./orm/adjustmentcredit.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema adjustmentdebit --outfile ./orm/adjustmentdebit.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema balance --outfile ./orm/balance.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema common --outfile ./orm/common.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema cutoff --outfile ./orm/cutoff.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema delivery --outfile ./orm/delivery.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema demand --outfile ./orm/demand.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema despatch --outfile ./orm/despatch.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema goal --outfile ./orm/goal.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema issue --outfile ./orm/issue.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema lot --outfile ./orm/lot.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema picklist --outfile ./orm/picklist.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema rebound --outfile ./orm/rebound.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema receipt --outfile ./orm/receipt.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema reserve --outfile ./orm/reserve.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema schedule --outfile ./orm/schedule.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema stockcard --outfile ./orm/stockcard.py postgresql://postgres:postgres@localhost:5432/wms
sqlacodegen --schema stocktake --outfile ./orm/stocktake.py postgresql://postgres:postgres@localhost:5432/wms