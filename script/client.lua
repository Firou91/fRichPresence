local appid = Config.AppID
local image1 = Config.Image1
local image2 = Config.Image2

function players()
  local players = {}

  for i = 0, 62 do
    if NetworkIsPlayerActive(i) then
        table.insert(players, i)
    end
  end

  return players
  
end

function SetRP()

  local name = GetPlayerName(PlayerId())
  local id = GetPlayerServerId(PlayerId())

  SetDiscordAppId(appid)
  SetDiscordRichPresenceAsset(image1)
  SetDiscordRichPresenceAssetSmall(image2)

end

Citizen.CreateThread(function()

  while true do

    Citizen.Wait(5000)

    SetRP()
    SetDiscordRichPresenceAssetText(Config.RichpPresenceAssetText)

    players = {}
    for i = 0, 128 do
        if NetworkIsPlayerActive( i ) then
            table.insert( players, i )
        end
    end

    SetRichPresence("Pseudo: " ..GetPlayerName(PlayerId()) .. " | ID: " ..GetPlayerServerId(PlayerId()) .. "")

    SetDiscordRichPresenceAction(0, Config.RichPresenceButtonText1, Config.RichPresenceLink1)
    SetDiscordRichPresenceAction(1, Config.RichPresenceButtonText2, Config.RichPresenceLink2)
  end

end)
