
my_dict = {"good_code": "10.01.10.100-001", "quantity": "10.000", "uom_code": "kg"}
my_list = ["tst1", "tst2"]
my_tuple = ("tst1", "tst2")


document_head = {"id": 1, "name": "DMD-01", "facility": "A1"}
document_body_row1 = {"good_code": "10.01.100-001", "qty": 10 }
document_body_row2 = {"good_code": "10.01.200-001", "qty": 10 }
document_body = [document_body_row1, document_body_row2]

document = {"head": document_head, "body": document_body}

print(my_dict, type(my_dict))
print(my_list, type(my_list))
print(my_tuple, type(my_tuple))
print("document")
print(document, type(document))


