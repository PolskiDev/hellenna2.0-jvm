-- @REPLACE RULES:

--from:  (func_ret, v)
--to:    (func_ret, v)

--from:  return 
--to:    file:write("var "..func_ret:sub(2).." = "..


Cast = {}
function Cast.toString(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as String")

    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as String")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as String")
    end
end
function Cast.toBoolean(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as Boolean")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as Boolean")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as Boolean")
    end
end


--@FLOAT
function Cast.toFloat(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as Float")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as Float")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as Float")
    end
end
function Cast.toDouble(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as Double")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as Double")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as Double")
    end
end


--@INTEGER
function Cast.toInt(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as Int")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as Int")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as Int")
    end
end
function Cast.toInt8(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as Byte")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as Byte")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as Byte")
    end
end
function Cast.toInt16(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as Short")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as Short")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as Short")
    end
end
function Cast.toInt32(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as Int")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as Int")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as Int")
    end
end
function Cast.toInt64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as Long")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as Long")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as Long")
    end
end

--@UNSIGNED INTEGER
function Cast.toUInt(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as UInt")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as UInt")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as UInt")
    end
end
function Cast.toUInt8(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as UByte")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as UByte")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as UByte")
    end
end
function Cast.toUInt16(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as UShort")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as UShort")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as UShort")
    end
end
function Cast.toUInt32(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as UInt")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as UInt")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as UInt")
    end
end
function Cast.toUInt64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""v:sub(2)"\" as ULong")
    elseif v:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..v:sub(2).." as ULong")
    else
        file:write("var "..func_ret:sub(2).." = "..v.." as ULong")
    end
end