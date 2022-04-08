(import) "Hellenna.lang"
(import) "Hellenna.stdio"
(import) "Hellenna.error"
(import) "Hellenna.stdtab"
(import) "Hellenna.var"
(import) "Hellenna.arr.oper"
(import) "Hellenna.incr"
(import) "Hellenna.loops"
(import) "Hellenna.file"
(import) "Hellenna.fn"
(import) "Hellenna.pkg"
(import) "Hellenna.mod"


namespace "main"
    (package) "com.gabrielmargarido.hellenna.jvm"
    
    (import_java) "java.lang.*"
    (import_java) "java.io.*"
    (import_java) "java.util.*"


    fn("main:void") >>
        (import_module) "main"

        let (|$msg:string|, "&Hello world")
        Console.WriteLine |$msg|

        Console.WriteLine "&Hallo Welt"
        Console.WriteLine |"Hello "+"Darwin"|
        
    ..;

    

    
..?