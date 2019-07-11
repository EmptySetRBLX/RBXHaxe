module.exports = class Class{
    constructor(json, classesParent)
    {
        this.RawJson = json;
        this.Name = json.Name;
        this.Line = "TODO " + json.Name;
        this.classesParent = classesParent;
        this.Parameters = json.Parameters;

        this.ReturnType = this.parseReturnType(json.ReturnType);
        if(this.ReturnType == "Tuple")
        {
            var needsUnpacking = false;
            this.Line = "inline function " + this.Name + "(";
            for(var i=0; i<this.Parameters.length; i++)
            {
                if(this.Parameters[i].Type.Category == "Group" && this.Parameters[i].Type.Name == "Tuple")
                {
                    needsUnpacking = true;
                    this.Line = this.Line + this.Parameters[i].Name + ":AnyTable";
                    //dont need comma, should always be last arg
                }else
                {
                    this.Line = this.Line + this.parseParameter(this.Parameters[i]);
                    if(i != this.Parameters.length - 1){
                        this.Line = this.Line + ", ";
                    }
                }
            }
            this.Line = this.Line + "):AnyTable";
            this.Line = this.Line + " {\n\t\treturn untyped __lua__(\"{{0}";
            switch(this.classesParent)
            {
                case null:
                    this.Line = this.Line + ".";
                    break;
                default:
                    this.Line = this.Line + ":";
            }
            this.Line = this.Line + this.Name + "(";
            for(var i=1; i<=this.Parameters.length; i++)
            {
                if(i == this.Parameters.length)
                {
                    if(needsUnpacking == true)
                    {
                        this.Line = this.Line + "unpack({" + i + "})";
                    }else
                    {
                        this.Line = this.Line + "{" + i + "}";
                    }
                }else
                {
                    this.Line = this.Line + "{" + i + "}";
                    this.Line = this.Line + ", ";
                }
            }
            this.Line = this.Line + ")}\", this";
            for(var i=0; i < this.Parameters.length; i++)
            {
                this.Line = this.Line + ", " + this.Parameters[i].Name;
            }
            this.Line = this.Line + ");\n\t}";
        }else{
            this.Line = "function " + this.Name + "("
            for(var i=0; i<this.Parameters.length; i++)
            {
                this.Line = this.Line + this.parseParameter(this.Parameters[i]);
                if(i != this.Parameters.length - 1){
                    this.Line = this.Line + ", ";
                }
            }
            this.Line = this.Line + "):" + this.ReturnType + ";";
        }
    }

    parseReturnType(returnType)
    {
        switch(returnType.Category)
        {
            case "Primitive":
                switch(returnType.Name)
                {
                    case "bool":
                        return "Bool";
                    case "string":
                        return "String";
                    case "int":
                        return "Int";
                    case "int64":
                        return "Int64";
                    case "float":
                    case "double":
                        return "Float";
                    case "void":
                        return "Void";
                    default:
                        console.log("Something went horribly wrong while processing return value primitives");
                        return "Void";
                }
            case "DataType":
                switch(returnType.Name)
                {
                    case "Objects":
                        return "AnyTable";
                    case "Function":
                        return "Function";
                    case "Content":
                        return "String";
                    default:
                        return returnType.Name;
                }
            case "Enum":
                return "EnumItem";
            case "Class":
                if(returnType.Name == "Instance") {
                    return "Dynamic"
                }
                return returnType.Name;
            case "Group":
                switch(returnType.Name)
                {
                    case "Tuple":
                        return "Tuple";
                    case "Variant":
                        return "Dynamic";
                    case "Array":
                    case "Map":
                    case "Dictionary":
                        return "AnyTable";
                    default:
                        console.log("Something went wrong processing function special types");
                }
            default:
                console.log(this.Name + ", " + returnType.Category)
        }
    }

    parseParameter(param)
    {
        var name = param.Name;
        var line = name + ":";
        if(param.Type.Category == "DataType")
        {
            switch(param.Type.Name)
            {
                case "Objects":
                    line = line + "AnyTable";
                    return line;
                case "Function":
                    line = line + "Function";
                    return line;
                case "Content":
                    line = line + "String";
                    return line;
                default:
                    line = line + param.Type.Name;
                    return line;
            }
        }else if(param.Type.Category == "Primitive")
        {
            switch(param.Type.Name)
            {
                case "bool":
                    line = line + "Bool";
                    return line;
                case "string":
                    line = line + "String";
                    return line;
                case "int":
                    line = line + "Int";
                    return line;
                case "int64":
                    line = line + "Int64";
                    return line;
                case "float":
                case "double":
                    line = line +"Float";
                    return line;
                default:
                    console.log("Something went horribly wrong while processing function primitives");
                    return line;
            }
        }else if(param.Type.Category == "Group")
        {
            switch(param.Type.Name)
            {
                case "Tuple":
                    line = line + "Rest<Dynamic>";
                    return line;
                case "Variant":
                    line = line + "Dynamic";
                    return line;
                case "Array":
                case "Dictionary":
                    line = line + "AnyTable";
                    return line;
                default:
                    console.log("Something went wrong processing function special types");
            }
        }else if(param.Type.Category == "Class")
        {
            line = line + param.Type.Name;
            return line;
        }else if(param.Type.Category == "Enum")
        {
            line = line + "EnumItem";
            return line;
        }
        console.log("Error: unknown function category");
        return line;
    }

    getLine()
    {
        return this.Line;
    }
}