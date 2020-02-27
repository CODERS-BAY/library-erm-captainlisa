# Library-ERM
A library manages books and journals. Each book is published by a publishing house, there may be several copies of each book, which can also be borrowed by customers. There are published issues of the journals, these are only available once, a loan is not possible.
The articles published in the journals as well as the books should be managed in such a way that comfortable functions for information retrieval are possible: In addition to the assignment of a subject area, there should also be a keyword, whereby the relevance of each assigned keyword is important. Synonymous keywords should be recorded. Articles and books can each have several authors. Certain books can each have one book as a translation template, articles can reference each other:
Each borrowing is handled by one employee, and one employee is also responsible for returning the book copy.
Customers can also reserve books, each reservation usually results in a loan. The books and magazines are stored on shelves. A journal is placed on a shelf, and each shelf is assigned a subject area for te storaghe of the books.

## ER-Model

![ER-Model](library_erm.jpeg)

## Relational Model

* Book (**ISBN:int**, _SA-ID:int_, _List-ID:int_, publisher:varchar(32), title:varchar(32), copys:int, stock_nr:int, translation_template:int)
* Authorlist (**List-ID:int**, _ISBN:int_, _Author-ID:int_)
* Author (**Author-ID:int**, name:varchar(32), country:varchar(32))
* Journal (**ISBN:int**, publisher:varchar(32), _SA-ID:int_, _Author-ID:int_, title:varchar(32), keyword:varchar(32))
* Article (**Article-Nr:int**, *ISBN:int*, _SA-ID:int_, name:varchar(32),  _List-ID:int_)
* Articlelist (**Article1-Nr:int**, **Article2-Nr:int**, _ISBN-1:int_, _ISBN-2:int, name1:varchar(32), name2:varchar(32))
* Subject Area (**SA-ID:int**, _keyword:varchar(32)_ name:varchar(32))
* Employee (**Personal-ID:int**, name:varchar(32), date_of_Birth:date, address:varchar(32), phone:int, email:varchar(32), bank_information:varchar(32))
* Customer (**Personal-ID:int**, name:varchar(32), _Borrowing-Nr:int_, address:varchar(32), phone:int, email:varchar(32))
* Shelve (**Shelve-Nr:int**, _SA-ID:int_, location:varchar(32))
* Borrowing (**Borrowing-Nr:int**, _ISBN:int_ ,_Author-ID:int_, _Customer-Personal-ID:int_, stock_nr:int, date_lending:date, date_return:date, _employee-ID_lending:int_, _employee-ID_return:int_)
* Keyword (**keyword:varchar(32)**, _Shelve-Nr:int_, relevance:int)
* Synonym (**_keyword1:varchar(32)_**, **_keyword2:varchar(32)_**)
* Reservation (**Reserveration-Nr:int**, _Customer-Personal-ID:int_, _ISBN:int_, loan:double, date:date)