--@ fn("hello:string", ...)
function fn(name, arguments)
    local t = name:sub(name:find(":")+1)      --struct element (type)
    local n = name:sub(1,name:find(":")-1)    --struct element (name)
    
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
    t = t:gsub("string","String")
    t = t:gsub("void","Unit")


    if n == "main" then
        file:write("fun "..n.."(args: Array<String>): "..t.." {",'\n')
    else
        -- @logic
        if arguments == nil then
            file:write("fun "..n.."(): "..t.." {",'\n')
        else
            file:write("fun "..n.."("..arguments.."): "..t.." {",'\n')
        end
        
    end
    
end

function ret(val)
    if val:sub(1,1) == "&" then
        file:write("return \""..val:sub(2).."\"",'\n')
    
    elseif val:sub(1,1) == "$" then
        file:write("return "..val:sub(2),'\n')
    else
        file:write("return "..val,'\n')
    end
    
end

function Syscall(fun_name,arguments)

    if arguments ~= nil then
        if arguments:sub(1,1) == "&" then
            file:write(fun_name.."(\""..arguments:sub(2).."\")",'\n')

        elseif arguments:sub(1,1) == "$" then
            file:write(fun_name.."("..arguments:sub(2)..")",'\n')
        else
            file:write(fun_name.."("..arguments..")",'\n')
        end
        
    else
        file:write(fun_name.."()",'\n')
    end

end
