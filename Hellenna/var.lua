--@ let(|$my_variable:string|, "&Hello world")
--@ let(|$my_variable:int|, |136|)
--@ let(|$my_variable:float, |$another_variable|)
--@ let(|$my_variable:double, |$another_variable|)

function let(name,value)
    name = tostring(name)
    value = tostring(value)
    
    local n = name:sub(1,name:find(":")-1)    --var (name)
    local t = name:sub(name:find(":")+1)      --var (type)

    -- @Micro embedded parser
    t = t:gsub("int","Int")
    t = t:gsub("uint","UInt")
    t = t:gsub("rune","Int")    
    
    t = t:gsub("int8","Byte")
    t = t:gsub("int16","Short")
    t = t:gsub("int32","Int")
    t = t:gsub("int64","Long")
    
    t = t:gsub("uint8","UByte")
    t = t:gsub("uint16","UShort")
    t = t:gsub("uint32","UInt")
    t = t:gsub("uint64","ULong")
    t = t:gsub("uintptr","UInt")
    
    
    t = t:gsub("byte","Byte")
    t = t:gsub("short","Short")
    t = t:gsub("long","Long")
    
    t = t:gsub("float","Float")
    t = t:gsub("double","Fouble")
    
    t = t:gsub("boolean","Boolean")
    t = t:gsub("string","String")



    if name:find(":") ~= nil then
        --@exists explicit declaration
        if n:sub(1,1) == "$"
        or n:sub(1,1) == "@" then
            if value:sub(1,1) == "&" then
                file:write("var "..n:sub(2)..":"..t.." = \""..value:sub(2).."\"\n")

            elseif value:sub(1,1) == "$"
            or value:sub(1,1) == "@" then
                file:write("var "..n:sub(2)..":"..t.." = "..value:sub(2).."\n")
            else
                file:write("var "..n:sub(2)..":"..t.." = "..value.."\n")
            end

        else
            if value:sub(1,1) == "&" then
                file:write("var "..n..":"..t.." = \""..value:sub(2).."\"\n")

            elseif value:sub(1,1) == "$" then
                file:write("var "..n..":"..t.." = "..value:sub(2).."\n")
            else
                file:write("var "..n..":"..t.." = "..value.."\n")
            end
            
        end

    else

        --@exists inference (NOT WORKING)
        if n:sub(1,1) == "$" then
            file:write(n:sub(2).." := "..t,'\n')
        else
            file:write(n.." := "..t,'\n')
        end

    end
end






--@ var(|my_variable|, "&Hello world")
--@ var(|my_variable|, |136|)
--@ var(|my_variable|, |another_variable|)
function var(name,value)
    if value:sub(1,1) == "&"
    or value:sub(1,1) == "$" 
    or value:sub(1,1) == "@" then
        -- String:      &Arnold
        file:write(name:sub(2).." = \""..value.."\"",'\n')
    else
        -- Number:      136
        file:write(name.." = "..value,'\n')
    end
end
