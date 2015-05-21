import std.stdio;
import std.conv : to;

enum dchar[] encodeMap = [
	//shitty spaces
	' ',//U+20
	' ',//U+2002
	' ',//U+2003
	' ',//U+2004
	' ',//U+2005
	' ',//U+2006
	' ',//U+2007
	' ',//U+2008
	' ',//U+2009
	' ',//U+200A
	'​',//U+200B
	' ',//U+202F
	' ',//U+205F
	'⁢',//U+2062
	'⁣',//U+2063
	'⁤',//U+2064
	'　',//U+3000
	'﻿',//U+FEFF

	//rtl/ltr
	'‏',//U+200F
	'‫',//U+202B
	'‮',//U+202E
	'⁧',//U+2067
	'‪',//U+202A
	'‭',//U+202D
	'⁦',//U+2066
];

string genDecode(){
	string ret;
	foreach(i, c ; encodeMap){
		ret~=(cast(size_t)(c)).to!string~": "~i.to!string~",\n";
	}
	return ret;
}

//pragma(msg, genDecode());

mixin("enum byte[dchar] decodeMap = ["~genDecode()~"];");



dchar[2] encode(in ubyte value){
	return [
		encodeMap[(value/encodeMap.length).to!uint],
		encodeMap[value%encodeMap.length]
		];
}
ubyte decode(in dchar[2] value){
	if(value[0] in decodeMap && value[1] in decodeMap)
		return (decodeMap[value[0]]*encodeMap.length + decodeMap[value[1]]).to!ubyte;

	writeln((value[0]).to!string);
	assert(0, "unknown decode map key");
}

int main(string[] args) {	
	if(args.length!=2){
		writeln("Usage: ",args[0]," (encode|decode)");
		writeln();
		writeln("       stdin: input data");
		writeln("       stdout: generated data");
		return 1;
	}

	if(args[1]=="encode"){
		dstring output;

		ubyte[1] buf;
		while(stdin.rawRead!ubyte(buf)){
			output~=encode(buf[0]);
		}

		writeln(output);
	}
	else if(args[1]=="decode"){
		ubyte[] output;

		dchar last = 0;
		foreach(dchar c ; stdin.readln!dstring()){
			if(last!=0){
				output ~= decode([last, c]);
				last = 0;
			}
			else
				last = c;
		}

		stdout.rawWrite(output);
	}

	return 0;
}