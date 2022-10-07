CREATE TABLE "Book"(
    "ISBN" INTEGER NOT NULL,
    "Year" INTEGER NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Author" VARCHAR(255) NOT NULL,
    "Pages" INTEGER NOT NULL,
    "Publisher" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Book" ADD PRIMARY KEY("ISBN");
CREATE TABLE "Publisher"(
    "Name" VARCHAR(255) NOT NULL,
    "Address" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Publisher" ADD PRIMARY KEY("Name");
CREATE TABLE "BookCopy"(
    "Number" INTEGER NOT NULL,
    "Place on shelf" INTEGER NOT NULL,
    "ISBN" INTEGER NOT NULL
);
ALTER TABLE
    "BookCopy" ADD PRIMARY KEY("Number");
CREATE TABLE "Book category"(
    "id" INTEGER NOT NULL,
    "Book" INTEGER NOT NULL,
    "Category" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Book category" ADD PRIMARY KEY("id");
CREATE TABLE "Category"(
    "Name" VARCHAR(255) NOT NULL,
    "Parent" INTEGER NOT NULL
);
ALTER TABLE
    "Category" ADD PRIMARY KEY("Name");
CREATE TABLE "Borrow"(
    "id" INTEGER NOT NULL,
    "Return day" DATE NOT NULL,
    "Book copy" INTEGER NOT NULL,
    "Reader" INTEGER NOT NULL
);
ALTER TABLE
    "Borrow" ADD PRIMARY KEY("id");
CREATE TABLE "Reader"(
    "id" INTEGER NOT NULL,
    "Last name" VARCHAR(255) NOT NULL,
    "First name" VARCHAR(255) NOT NULL,
    "Address" VARCHAR(255) NOT NULL,
    "Birthday" DATE NOT NULL
);
ALTER TABLE
    "Reader" ADD PRIMARY KEY("id");
ALTER TABLE
    "Book category" ADD CONSTRAINT "book category_book_foreign" FOREIGN KEY("Book") REFERENCES "Book"("ISBN");
ALTER TABLE
    "BookCopy" ADD CONSTRAINT "bookcopy_isbn_foreign" FOREIGN KEY("ISBN") REFERENCES "Book"("ISBN");
ALTER TABLE
    "Borrow" ADD CONSTRAINT "borrow_book copy_foreign" FOREIGN KEY("Book copy") REFERENCES "BookCopy"("Number");
ALTER TABLE
    "Book category" ADD CONSTRAINT "book category_category_foreign" FOREIGN KEY("Category") REFERENCES "Category"("Name");
ALTER TABLE
    "Borrow" ADD CONSTRAINT "borrow_reader_foreign" FOREIGN KEY("Reader") REFERENCES "Reader"("id");
ALTER TABLE
    "Book" ADD CONSTRAINT "book_publisher_foreign" FOREIGN KEY("Publisher") REFERENCES "Publisher"("Name");