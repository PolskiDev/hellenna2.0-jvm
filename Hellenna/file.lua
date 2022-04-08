File = {}

function File.CreateFile(filename)
    if filename:sub(1,1) == "&" then
        file:write("var xfileName = \""..filename:sub(2).."\"")
    
    elseif filename:sub(1,1) == "$" then
        file:write("var xfileName = "..filename:sub(2))
    else
        file:write("var xfileName = "..filename)
    end
    
    file:write("var xfile = File(xfileName)")
    file:write("xfile.createNewFile()")
    
end


function File.WriteLine(filename, text)
    file:write("try {"..'\n')

    if filename:sub(1,1) == "&" then
        file:write("var __FileName__ = \""..filename:sub(2).."\""..'\n')
    
    elseif filename:sub(1,1) == "$" then
        file:write("var __FileName__ = "..filename:sub(2).."\n")
    else
        file:write("var __FileName__ = "..filename.."\n")
    end
    
    file:write("var __MyFile__ = File(__FileName__)"..'\n')
    file:write("__MyFile__.printWriter().use {"..'\n')
    file:write("out->"..'\n')

    if filename:sub(1,1) == "&" then
        file:write("out.println(\""..text:sub(2).."\")"..'\n')
    
    elseif filename:sub(1,1) == "$" then
        file:write("out.println("..text:sub(2)..")"..'\n')
    else
        file:write("out.println("..text..")"..'\n')
    end
    
    file:write("} catch(e:Exception) {"..'\n')
    file:write("e.printStackTrace()"..'\n')
    file:write("}"..'\n')

end
function File.ReadLine(filename, returned_string)
    file:write("try {\n")

    if filename:sub(1,1) == "&" then
        file:write("var "..returned_string..":List<String> = File(\""..filename:sub(2).."\").readLines()")

    elseif filename:sub(1,1) == "$" then
        file:write("var "..returned_string..":List<String> = File("..filename:sub(2)..").readLines()")
    
    else
        file:write("var "..returned_string..":List<String> = File("..filename..").readLines()")
    
    end
    
    file:write(" } catch(e:Exception) { e.printStackTrace() }")

end