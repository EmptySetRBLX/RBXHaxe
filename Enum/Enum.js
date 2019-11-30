const strStream = require('string-to-stream');

function writeLine(str, line)
{
    return str + line + "\n";
}

module.exports = class Class{   
    constructor(json)
    {
        this.Name = json.Name;
        this.rawJson = json;
        this.Items = [];
        this.ItemsJson = json.Items;
    }

    getReadStream()
    {
        let file = "@:native(\"RBXEnum." + this.Name + "\")\n";
        file = writeLine(file, "extern class " + this.Name);
        file = writeLine(file, "{");
        for (var i=0; i<this.ItemsJson.length; i++)
        {
            file = writeLine(file, "\tpublic static var " + this.ItemsJson[i].Name + ":EnumItem;");
        }
        file = writeLine(file, "}");
        return strStream(file);
    }
}