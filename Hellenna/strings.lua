-- @REPLACE RULES:

--from:  (func_ret, v)
--to:    (func_ret, v)

--from:  return 
--to:    file:write("var "..func_ret:sub(2).." = "..


String = {}


-- FIND CHAR IN STRING
--@ let (|$variable:string|, "&Hello world")
--@ String.find(|$variable|, "&w")

--@ let (|$variable:string|, "&Hello world")
--@ let (|$char:string|, "&w")
--@ String.find(|$variable|, |$char|)

--@ String.find("&Hello world", "&w")
function String.find(func_ret, s, substring)
    if s:sub(1, 1) == "&" then
        if substring:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".indexOf(\""..substring:sub(2).."\")"

            --file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".find(\""..substring:sub(2).."\")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index(\""..s:sub(2).."\", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".indexOf("..substring:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".find("..substring:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index(\""..s:sub(2).."\", "..substring:sub(2)..")"
        else
            file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".indexOf("..substring:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".find("..substring..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index(\""..s:sub(2).."\", "..substring..")"
        end

    elseif s:sub(1, 1) == "$" then
        if substring:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".indexOf(\""..substring:sub(2).."\")"
            --file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".find(\""..substring:sub(2).."\")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".indexOf("..substring:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".find("..substring:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", "..substring:sub(2)..")"
        else
            --file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".indexOf("..substring..")"
            --file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".find("..substring..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", "..substring..")"
        end
    else
        if substring:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = "..s..".indexOf(\""..substring:sub(2).."\")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = "..s..".indexOf("..substring:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", "..substring:sub(2)..")"
        else
            file:write("var "..func_ret:sub(2).." = "..s..".indexOf("..substring..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", "..substring..")"
        end
    end
    
end


--@ Console.WriteLine(|String.slice("&Hello world", |1:3|)|)

--@ let (|$variable:string|, "&Hello world")
--@ Console.WriteLine(|String.slice("$variable", |1:3|)|)
function String.slice(func_ret, s,seq)
    local seq_begin = seq:sub(1,seq:find(":")-1)    --var (name)
    local seq_end = seq:sub(seq:find(":")+1)      --var (type)
    
    if s:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".slice("..seq_begin..".."..seq_end..")"

    elseif s:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".slice("..seq_begin..".."..seq_end..")" 
    else
        file:write("var "..func_ret:sub(2).." = "..s..".slice("..seq_begin..".."..seq_end..")" 
    end
end


--@ let(|$variable:string|, "&Hello World")
--@ Console.WriteLine(Strings.replace(|$variable|, "Hello","Bye"))

function String.replace(func_ret, var, x,y)

    if x:sub(1,1) == "&" then
        if y:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = "..var..".replace(\""..x:sub(2).."\",\""..y:sub(2).."\")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", \""..x:sub(2).."\",\""..y:sub(2).."\")"
        
        elseif y:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = "..var..".replace(\""..x:sub(2).."\","..y:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", \""..x:sub(2).."\","..y:sub(2)..")"
        else
            file:write("var "..func_ret:sub(2).." = "..var..".replace(\""..x:sub(2).."\","..y..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", \""..x:sub(2).."\","..y..")"
        end
    
    elseif x:sub(1,1) == "$" then
       
        if y:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = "..var..".replace("..x:sub(2)..",\""..y:sub(2).."\")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", "..x:sub(2)..",\""..y:sub(2).."\")"
        
        elseif y:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = "..var..".replace("..x:sub(2)..","..y:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", "..x:sub(2)..","..y:sub(2)..")"
        else
            file:write("var "..func_ret:sub(2).." = "..var..".replace("..x:sub(2)..","..y..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", "..x:sub(2)..","..y..")"
        end

    else

        if y:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = "..var..".replace("..x..",\""..y:sub(2).."\")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", "..x:sub(2)..",\""..y:sub(2).."\")"
        
        elseif y:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = "..var..".replace("..x..","..y:sub(2)..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", "..x:sub(2)..","..y:sub(2)..")"
        else
            file:write("var "..func_ret:sub(2).." = "..var..".replace("..x..","..y..")"
            --file:write("var "..func_ret:sub(2).." = ".."strings.Replace("..var..", "..x:sub(2)..","..y..")"
        end
    end
end



--@ let(|$cadeia:string|, "&Hello World")
--@ String.split(|$replaced_var|, |$cadeia|, "-")
--@ Console.WriteLine(|$replaced_var|)

function String.split(func_ret, split_var,split_char)
    file:write("var "..func_ret:sub(2).." = "..split_var:sub(2)..".split(\""..split_char.."\")")
end


--(NON-PORTABLE) STRING.REVERSE ONLY EXISTS ON JVM IMPLEMENTATION!

--@ Console.WriteLine(|String.uppercase("&hello world")|)
--@ Console.WriteLine(|String.uppercase(|$variable|)|)
--@ Console.WriteLine(|String.uppercase(|variable|)|)
function String.reverse(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".reversed()"

    elseif s:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".reversed()"
    else
        file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".reversed()"
    end
end



--@ Console.WriteLine(|String.uppercase("&hello world")|)
--@ Console.WriteLine(|String.uppercase(|$variable|)|)
--@ Console.WriteLine(|String.uppercase(|variable|)|)
function String.uppercase(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".capitalize()"

    elseif s:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".capitalize()"
    else
        file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".capitalize()"
    end
end


--@ Console.WriteLine(|String.lowercase("&HELLO WORLD")|)
--@ Console.WriteLine(|String.lowercase(|$variable|)|)
--@ Console.WriteLine(|String.lowercase(|variable|)|)

function String.lowercase(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".lowercase()"

    elseif s:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".lowercase()"
    else
        file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".lowercase()"
    end
end


--@ Console.WriteLine(|String.len("&HELLO WORLD")|)
--@ Console.WriteLine(|String.len(|$variable|)|)
--@ Console.WriteLine(|String.len(|variable|)|)
function String.len(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".length"

    elseif s:sub(1,1) == "$" then
        file:write("var "..func_ret:sub(2).." = "..s:sub(2)..".length"
    else
        file:write("var "..func_ret:sub(2).." = "..s..".length"
    end
end



-- STRING.INCLUDES
--@ Console.WriteLine( |String.includes("&HELLO WORLD", "&HELLO")| )

--@ Console.WriteLine( |String.includes(|$variable|,|$another|)| )
--@ Console.WriteLine( |String.includes(|variable|,|another|)| )

--@ Console.WriteLine( |String.includes(|variable|,"&HELLO")| )
--@ Console.WriteLine( |String.includes("&HELLO", |variable|)| )
function String.includes(func_ret, s,x)
    if s:sub(1,1) == "&" then
        --(s) is string
        if x:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\" in \""..x:sub(2).."\""
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains(\""..s:sub(2).."\",\""..x:sub(2).."\")"
        
        elseif x:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\" in "..x:sub(2)
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains(\""..s:sub(2).."\","..x:sub(2)..")"
        else
            file:write("var "..func_ret:sub(2).." = ".."\""..s:sub(2).."\" in "..x:sub(2)
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains(\""..s:sub(2).."\","..x..")"
        end

    elseif s:sub(1,1) == "$" then
        --(s) is variable
        if x:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = "..s:sub(2).." in \""..x:sub(2).."\""
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..",\""..x:sub(2).."\")"
        
        elseif x:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = "..s:sub(2).." in "..x:sub(2)
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..","..x:sub(2)..")"
        else
            file:write("var "..func_ret:sub(2).." = "..s:sub(2).." in "..x
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..","..x..")"
        end


    else
        if x:sub(1,1) == "&" then
            file:write("var "..func_ret:sub(2).." = "..s.." in \""..x:sub(2).."\""
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..",\""..x:sub(2).."\")"
        
        elseif x:sub(1,1) == "$" then
            file:write("var "..func_ret:sub(2).." = "..s.." in "..x:sub(2)
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..","..x:sub(2)..")"
        else
            file:write("var "..func_ret:sub(2).." = "..s.." in "..x
            --file:write("var "..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..","..x..")"
        end
    end
end
