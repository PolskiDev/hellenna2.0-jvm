Console = {}

-- Console.ReadLine(|x:string|)
-- Console.ReadLine(|x:int|)
function Console.ReadLine(s)
    
    local t = s:sub(s:find(":")+1)      --var (type)
    local n = s:sub(1,s:find(":")-1)    --var (name)


    -- @Micro embedded parser
    t = t:gsub("int","Int")
    t = t:gsub("uint","Int")
    t = t:gsub("rune","Int")    

    t = t:gsub("int8","Int")
    t = t:gsub("int16","Int")
    t = t:gsub("int32","Int")
    t = t:gsub("int64","Int")

    t = t:gsub("uint8","Int")
    t = t:gsub("uint16","Int")
    t = t:gsub("uint32","Int")
    t = t:gsub("uint64","Int")
    t = t:gsub("uintptr","Int")


    t = t:gsub("byte","Byte")
    t = t:gsub("short","Short")
    t = t:gsub("long","Long")

    t = t:gsub("float","Float")
    t = t:gsub("double","Double")

    t = t:gsub("boolean","Boolean")
    t = t:gsub("string","Line")



    file:write("var __"..n.." = Scanner(System.`in`);")
    file:write("var "..n.." = __"..n..".next"..t.."();")

end



--@ Console.WriteLine("&Hello world")       --> String
--@ Console.WriteLine("$x")              --> Variable
--@ Console.WriteLine(|136|)                --> Numeric

function Console.WriteLine(s)
    if s:sub(1,1) == "&" then
        file:write("println(\""..s:sub(2).."\")",'\n')
    
    elseif s:sub(1,1) == "$" or s:sub(1,1) == "@" then
        file:write("println("..s:sub(2)..")",'\n')
    else
        file:write("println("..s..")",'\n')
    end
    
end
function Console.Write(s)
    if s:sub(1,1) == "&" then
        file:write("print(\""..s:sub(2).."\")",'\n')
    
    elseif s:sub(1,1) == "$" or s:sub(1,1) == "@" then
        file:write("print("..s:sub(2)..")",'\n')
    
    else
        file:write("print("..s..")",'\n')
    end
    
end