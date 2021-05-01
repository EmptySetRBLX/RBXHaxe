const propertyClass = require('./Property.js');
const functionClass = require('./Function.js');
const strStream = require('string-to-stream');

function writeLine(str, line)
{
    return str + line + "\n";
}

module.exports = class Class{   
    constructor(json)
    {
        this.Name = json.Name;
        this.Parent = null;
        this.rawJson = json;
        if(json.Superclass !== "<<<ROOT>>>")
        {
            this.Parent = json.Superclass;
        }
        this.Properties = [];
        this.Functions = [];
    }

    getReadStream()
    {
        let file = "import lua.Table;\nimport haxe.extern.Rest;\n" +
        "import haxe.Constraints.Function;\n\n";
        if(this.Parent !== null)
        {
            file = file + "extern class " + this.Name + " extends " + this.Parent + "\n";
        } else {
            file = file + "extern class " + this.Name + "\n";
        }

        file = writeLine(file, "{");

        for(let i=0; i < this.Properties.length; i++)
        {
            if (this.Properties[i].getLine() !== null) {
                file = writeLine(file, "\t" + this.Properties[i].getLine())
            }
        }
        for(let i=0; i < this.Functions.length; i++)
        {
            if (this.Functions[i].getLine() !== null) {
                file = writeLine(file, "\t" + this.Functions[i].getLine());
            }
        }
        file = writeLine(file, "}");

        return strStream(file);
    }

    parseMember(member)
    {
        //console.log(member);
        if(member.MemberType != "Function")
        {
            this.Properties.push(new propertyClass(member));
        }else{
            this.Functions.push(new functionClass(member, this.Parent));
        }
    }

    parseMembers()
    {
        let members = this.rawJson.Members;
        for(let i=0; i < members.length; i++)
        {
            this.parseMember(members[i]);
        }
    }
}