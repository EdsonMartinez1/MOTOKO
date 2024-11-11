import Array "mo:base/Array";  // Importar el módulo Array


actor Library {

    // Definir un tipo Book que tiene un título, autor y año de publicación
    type Book = {
        title: Text;
        author: Text;
        year: Nat;
    };

    // Almacenar los libros en un vector (lista) 
    var books : [Book] = [];

    // Agregar un libro a la biblioteca
    public func addBook(title: Text, author: Text, year: Nat) : async Text {
        let newBook : Book = { title = title; author = author; year = year };
        books := Array.append(books, [newBook]);  // Usar Array.append de manera correcta
        return "Libro agregado correctamente!";
    };

    // Obtener la lista completa de libros
    public func getBooks() : async [Book] {
        return books;
    };

    // Buscar un libro por título
    public func findBookByTitle(title: Text) : async ?Book {
        // Especificar que la función pasa un Book y retorna un Bool (predicado)
        switch (Array.find(books, func(b : Book) : Bool { b.title == title })) {
            case (?book) return ?book;
            case (_) return null;
        };
    };

    // Eliminar un libro por título
    public func removeBookByTitle(title: Text) : async Text {
        // Especificar que la función pasa un Book y retorna un Bool (predicado)
        books := Array.filter(books, func(b : Book) : Bool { b.title != title });  // Usar Array.filter correctamente
        return "Libro eliminado correctamente!";
    };
};