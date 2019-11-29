%{
#include <string.h>
#include"y.tab.h"
%}

%%
👤⬅		{yylval.string=strdup("me"); return NOUN;}
👥⬅	{yylval.string=strdup("we"); return NOUN;}
➡👤	{yylval.string=strdup("you"); return NOUN;}
➡️👥	{yylval.string=strdup("them"); return NOUN;}
👤👩	{yylval.string=strdup("she"); return NOUN;}
👤👨	{yylval.string=strdup("he"); return NOUN;}
👤👩⬅️	{yylval.string=strdup("her"); return NOUN;}
👤👨⬅️	{yylval.string=strdup("his"); return NOUN;}

🐌⏱️	{yylval.string=strdup("slow"); return NOUN;}
☄️⏱️	{yylval.string=strdup("fast"); return NOUN;}

😀	|
😃		{yylval.string=strdup("smile"); return NOUN;} 
😆	|
😂		{yylval.string=strdup("lmao"); return NOUN;}
😇		{yylval.string=strdup("angel"); return NOUN;}
🥰 |
😍		{yylval.string=strdup("inlove"); return NOUN;}
🤩		{yylval.string=strdup("amazed"); return NOUN;}
😘	|
😚	|
😙	|
😗		{yylval.string=strdup("kiss"); return VERB;}
😋	|
🤤		{yylval.string=strdup("delicious"); return NOUN;}
🤭		{yylval.string=strdup("oops"); return NOUN;}
🤫		{yylval.string=strdup("shhh"); return NOUN;}
🤐		{yylval.string=strdup("don't say a word"); return NOUN;}
🤒	|
🤠		{yylval.string=strdup("cowboy"); return NOUN;}
🤔		{yylval.string=strdup("mmm"); return NOUN;}
😲		{yylval.string=strdup("totally"); return NOUN;}
😛		{yylval.string=strdup("lick"); return VERB;}
😤		{yylval.string=strdup("ugh"); return NOUN;}


😟		{yylval.string=strdup("sad"); return NOUN;}
😄	| 
😁	|
🙂	|
😊		{yylval.string=strdup("happy"); return NOUN;}
😷		{yylval.string=strdup("sick"); return NOUN;}
🥵		{yylval.string=strdup("hot"); return NOUN;}
🥶		{yylval.string=strdup("cold"); return NOUN;}

🆒		{yylval.string=strdup("cool"); return NOUN;}
🆓		{yylval.string=strdup("free"); return NOUN;}
🆔		{yylval.string=strdup("ID"); return NOUN;}
🆘		{yylval.string=strdup("SOS"); return NOUN;}
🆕		{yylval.string=strdup("new"); return NOUN;}
🅰		{yylval.string=strdup("A"); return NOUN;}
🅱		{yylval.string=strdup("B"); return NOUN;}
🆎		{yylval.string=strdup("AB"); return NOUN;}
🆑		{yylval.string=strdup("CL"); return NOUN;}
🔤		{yylval.string=strdup("abc"); return NOUN;}
ℹ		{yylval.string=strdup("i"); return NOUN;}
🆗		{yylval.string=strdup("OK"); return NOUN;}
🅿		{yylval.string=strdup("P"); return NOUN;}
🆚		{yylval.string=strdup("VS"); return NOUN;}
🔙		{yylval.string=strdup("back"); return NOUN;}
🔚		{yylval.string=strdup("end"); return NOUN;}
🔛		{yylval.string=strdup("on"); return NOUN;}
🔜		{yylval.string=strdup("soon"); return NOUN;}
🔝		{yylval.string=strdup("top"); return NOUN;}
🆙		{yylval.string=strdup("up"); return NOUN;}

▶		{yylval.string=strdup("play"); return VERB;}
🔁		{yylval.string=strdup("repeat"); return NOUN;}
⏸		{yylval.string=strdup("pause"); return NOUN;}
⏹		{yylval.string=strdup("stop"); return VERB;}
🔀		{yylval.string=strdup("random"); return NOUN;}
❌️		{return NOT;}
➕		{yylval.string=strdup("and"); return NOUN;}

🍆		{yylval.string=strdup("eggplant"); return NOUN;}
🥑		{yylval.string=strdup("avocado"); return NOUN;}
🥔		{yylval.string=strdup("potato"); return NOUN;}
🥒		{yylval.string=strdup("cucumber"); return NOUN;}
🧅		{yylval.string=strdup("onion"); return NOUN;}
🧄		{yylval.string=strdup("garlic"); return NOUN;}
🍄		{yylval.string=strdup("mushroom"); return NOUN;}
🥬		{yylval.string=strdup("cabbage"); return NOUN;}

🍞		{yylval.string=strdup("bread"); return NOUN;}
🥨		{yylval.string=strdup("pretzel"); return NOUN;}
🥞		{yylval.string=strdup("pancakes"); return NOUN;}
🧇		{yylval.string=strdup("waffle"); return NOUN;}
🍖	|
🍗	|
🥩		{yylval.string=strdup("meat"); return NOUN;}
🥓		{yylval.string=strdup("bacon"); return NOUN;}
🍔		{yylval.string=strdup("hamburger"); return NOUN;}
🍟		{yylval.string=strdup("french fries"); return NOUN;}
🍕		{yylval.string=strdup("pizza"); return NOUN;}
🌭		{yylval.string=strdup("hot dog"); return NOUN;}
🥪		{yylval.string=strdup("sandwich"); return NOUN;}
🌮		{yylval.string=strdup("taco"); return NOUN;}
🌯		{yylval.string=strdup("burrito"); return NOUN;}
🥗		{yylval.string=strdup("salad"); return NOUN;}
🍿		{yylval.string=strdup("popcorn"); return NOUN;}

🥚		{yylval.string=strdup("egg"); return NOUN;}
🍳		{yylval.string=strdup("cooking"); return NOUN;}
🧈		{yylval.string=strdup("butter"); return NOUN;}
🧂		{yylval.string=strdup("salt"); return NOUN;}
🥫		{yylval.string=strdup("can"); return NOUN;}

🔴		{yylval.string=strdup("circle"); return NOUN;}
🟥		{yylval.string=strdup("square"); return NOUN;}
🔺		{yylval.string=strdup("triangle"); return NOUN;}
🔷		{yylval.string=strdup("diamond"); return NOUN;}
❤		{yylval.string=strdup("heart"); return HEART;}

👋		{yylval.string=strdup("hi"); return NOUN;}
👌		{yylval.string=strdup("perfect"); return NOUN;}
👈	|
⬅	 	{yylval.string=strdup("left"); return NOUN;}
👉	|
➡		{yylval.string=strdup("right"); return NOUN;}
👆	|
⬆		{yylval.string=strdup("up"); return NOUN;}
👇	|
⬇		{yylval.string=strdup("down"); return NOUN;}
👍		{yylval.string=strdup("good"); return NOUN;}
👎		{yylval.string=strdup("bad"); return NOUN;}

🦋		{yylval.string=strdup("pretty"); return NOUN;}
🔎		{yylval.string=strdup("find"); return VERB;}
🎮️		{yylval.string=strdup("game"); return NOUN;}
👨‍🎓️		{yylval.string=strdup("student"); return NOUN;}
✍️ 		{yylval.string=strdup("write"); return VERB;}
⚙️		{yylval.string=strdup("work"); return VERB;}
💬		{yylval.string=strdup("speech"); return NOUN;}
🦘		{yylval.string=strdup("jump"); return NOUN;}
⏱️		{yylval.string=strdup("time"); return NOUN;}
🛐		{yylval.string=strdup("religion"); return NOUN;}
🥃		{yylval.string=strdup("drink"); return NOUN;}
⚒️		{yylval.string=strdup("labor"); return NOUN;}
💃		{yylval.string=strdup("dance"); return VERB;}
🎭️		{yylval.string=strdup("act"); return NOUN;}
🌋		{yylval.string=strdup("volcano"); return NOUN;}
🤗		{yylval.string=strdup("hug"); return NOUN;}
🤝		{yylval.string=strdup("meeting"); return NOUN;}
🐮		{yylval.string=strdup("cow"); return NOUN;}
☎️		{yylval.string=strdup("telephone"); return NOUN;}
🍦		{yylval.string=strdup("ice cream"); return NOUN;}
🦙		{yylval.string=strdup("wool"); return NOUN;}
🕴️		{yylval.string=strdup("suit"); return NOUN;}
🐍		{yylval.string=strdup("snake"); return NOUN;}
🦆		{yylval.string=strdup("duck"); return NOUN;}
📷️		{yylval.string=strdup("camera"); return NOUN;}
⏳️		{yylval.string=strdup("wait"); return WAIT;}
👀		{yylval.string=strdup("see"); return VERB;}
🏊️		{yylval.string=strdup("swim"); return VERB;}
🎵	|
🎶		{yylval.string=strdup("music"); return NOUN;}
🌍	|
🌎	|
🌏		{yylval.string=strdup("world"); return NOUN;}
🏖		{yylval.string=strdup("beach"); return NOUN;}
🏠		{yylval.string=strdup("house"); return NOUN;}
✈		{yylval.string=strdup("travel"); return VERB;}
🚀		{yylval.string=strdup("rocket"); return NOUN;}
💡		{yylval.string=strdup("idea"); return NOUN;}
❗		{yylval.string=strdup("!"); return NOUN;}
❓		{yylval.string=strdup("?"); return NOUN;}
🎥		{yylval.string=strdup("movies"); return NOUN;}
🤬		{yylval.string=strdup("swear"); return VERB;}
😠		{yylval.string=strdup("hate"); return HATE;}
🏃		{yylval.string=strdup("run"); return VERB;}

[2]		{yylval.string=strdup("too"); return NOUN;}
[4]		{yylval.string=strdup("for"); return NOUN;}

[^ \t]+	{yylval.string=strdup(yytext); return NOUN;}
%%