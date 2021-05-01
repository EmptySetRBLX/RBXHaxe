module.exports = class Class{
    constructor(json)
    {
        this.RawJson = json;
        this.Name = json.Name;
        this.Line = "TODO " + json.MemberType;

        if (json.Tags == null || !json.Tags.includes("NotScriptable")) {
            if(json.MemberType != "Event")
            {
                if(json.MemberType == "Callback")
                {
                    this.Line = "public var " + this.Name + ":Function;";
                }else{
                    if(json.ValueType.Category == "Enum"){
                        this.Line = "public var " + this.Name + ":EnumItem;";
                    }else if(json.ValueType.Category == "Primitive")
                    {
                        switch(json.ValueType.Name)
                        {
                            case "bool":
                                json.ValueType.Name = "Bool";
                                break;
                            case "string":
                                json.ValueType.Name = "String";
                                break;
                            case "int":
                            case "int64":
                                json.ValueType.Name = "Int";
                                break;
                            case "float":
                            case "double":
                                json.ValueType.Name = "Float";
                                break;
                            default:
                                console.log("Invalid primitive type: " + json.ValueType.Name);
                        }
                        this.Line = "public var " + json.Name + ":" + json.ValueType.Name + ";";
                    }else if(json.ValueType.Category == "Class" || json.ValueType.Category == "DataType")
                    {
                        if(json.ValueType.Name == "Content")
                        {
                            this.Line = "public var " + json.Name + ":String;";
                        }else if(json.ValueType.Name == "ProtectedString"){
                            this.Line = "public var " + json.Name + ":String;";
                        }
                        else
                        {
                            this.Line = "public var " + json.Name + ":" + json.ValueType.Name + ";";
                        }
                    }else{
                        this.Line = "TODO PRIMITIVE: " + json.ValueType.Category; 
                    }
                }
            }else{
                this.Line = "public var " + json.Name + ":" + "RBXScriptSignal" + ";";
            }
        } else {
            this.Line = null
        }
    }

    getLine()
    {
        return this.Line;
    }
}