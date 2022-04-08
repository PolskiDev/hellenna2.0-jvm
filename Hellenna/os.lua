System = {}

function System.Process(cmd)
    file:write("Runtime.getRuntime().exec(\""..cmd.."\")")
end


function System.ifwindows()
    file:write("var OS:String = System.getProperty(\"os.name\").toLowerCase();")
    file:write("fun isWindows(): Boolean { return (OS.indexOf(\"win\") >=0); }")
    
    file:write("if(isWindows()) {")
    --  Close with:     ..;
end
function System.ifunix()
    file:write("var OS:String = System.getProperty(\"os.name\").toLowerCase();")
    file:write("fun isUnix(): Boolean { return (OS.indexOf(\"nix\") >=0 || OS.indexOf(\"nux\") >= 0 || OS.indexOf(\"aix\") >= 0); }")
    
    file:write("if(isUnix()) {")
    --  Close with:     ..;
end


function System.iflinux()
    System.ifunix()
end


function System.ifsolaris()
    file:write("var OS:String = System.getProperty(\"os.name\").toLowerCase();")
    file:write("fun isSolaris(): Boolean { return (OS.indexOf(\"sunos\") >=0); }")
    
    file:write("if(isSolaris()) {")
    --  Close with:     ..;
end

function System.ifdarwin()
    file:write("var OS:String = System.getProperty(\"os.name\").toLowerCase();")
    file:write("fun isMac(): Boolean { return (OS.indexOf(\"mac\") >=0); }")
    
    file:write("if(isMac()) {")
    --  Close with:     ..;
end