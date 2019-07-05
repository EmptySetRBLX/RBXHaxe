const getJson = require('./getJson');
const dumpJsons = require('./dumpJsons');
const rbxClass = require('./Class/Class.js');
const rbxEnum = require('./Enum/Enum.js');
const dumpClasses = require('./dumpHaxe.js');
const rimraf = require('rimraf');
const fs = require('fs');


getJson((error, json) => //grab json from web apis
{
    if(error !== null){
        throw error;
        return;
    }

    dumpJsons(json); //dump individual class and enum entries to file

    let classesJson = json.Classes;
    let classes = [];

    for(let i=0; i<classesJson.length; i++)
    {
        if(classesJson[i].Name == "Instance")
        {
            classesJson.splice(i, 1);
            console.log("gottem");
            break;
        }
    }

    for(let i=0; i<classesJson.length; i++)
    {
        classes[i] = new rbxClass(classesJson[i]);
        classes[i].parseMembers();
    }

    let enumsJson = json.Enums;
    let enums = [];
    for(let i=0; i<enumsJson.length; i++)
    {
        enums[i] = new rbxEnum(enumsJson[i]);
    }

    dumpClasses(classes, enums);

    
    console.log('json parsed');
})