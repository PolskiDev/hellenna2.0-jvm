Oper = {}

--@ New array with *size positions
--@ Oper.new(|vetor:string|, {{"Gabriel","Mike","Roberto"}} )
--@ Oper.new(|vetor:int|, {{2,4,6,8,10,12,14,16, ...}} )
function Oper.new(name,size)
    -- body
    local t = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    file:write("var "..n.." = arrayOf("..size..")")
end



--@ Add new value to an existing or new (index) in array
--@ Oper.set(|vetor:3|, "Gabriel")
function Oper.set(name, value)
    local pos = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    file:write(n..".set("..pos..","..value..")")
end

--@ Get value from an existing (index) in array
--@ Oper.get(|vetor:3|)
function Oper.get(func_ret, name)
    local pos = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    file:write("var "..func_ret:sub(2).." = "..n.."["..pos.."]")
end



--@ Oper.slice() -> non-available on Kotlin Implementation
--@ Oper.sliceIterate(|i|,|vetor|)
function Oper.sliceIterate(i,name)
    file:write("for("..i.." in "..name..") {")
end



-- @Append at last position the element *value
--@ -> Oper.add(|vetor|, {{ 14 }} )
--@ -> Oper.add(|vetor|, {{ 0, 2, 4, 8, 16, 32, ...}} )

function Oper.add(name, value)
    -- |vetor|     (or)     |vetor:retorno|
    file:write(name.." = append("..name..", "..value..")")
end