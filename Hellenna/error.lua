--@ ThrowError "System has been crashed!"
function ThrowError(s)
    file:write("throw Exception(\""..s.."\");\n")
end


--(NON-PORTABLE)
--@ try;;
--      ...
--
--@ catch;;
--      ...
--
--@ except;;
--      ...
--
--@ ..;

function try()
    file:write("try {\n")
end
function catch()
    file:write("} catch (e: SomeException) {\n")
end
function except()
    file:write("} finally {\n")
end