local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ShaDer Loader",
   Icon = rbxthumb://type=Asset&id="110232549367382"&w=150&h=150, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "ShaDer Loader",
   LoadingSubtitle = "by Fian_gg",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "ShaDerCahce"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("Load", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Load ShaDer",
   Callback = function()
         Rayfield:Notify({
   Title = "Loading ShaDer...",
   Content = "It takes time to run this script",
   Duration = 6.5,
   Image = 4483362458,
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/fiangg20/Fian_gg-Repo/refs/heads/main/ShaDer.lua"))()
   local Sound = Instance.new("Sound",game:GetService("SoundService"))
   Sound.SoundId = "rbxassetid://18595195017"
   Sound:Play()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load MoBlur (Motion Blur)",
   Callback = function()
         Rayfield:Notify({
   Title = "Loading MoBlur...",
   Content = "It takes time to run this script",
   Duration = 6.5,
   Image = 4483362458,
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/fiangg20/Fian_gg-Repo/refs/heads/main/MoBlur.lua"))()
   local Sound = Instance.new("Sound",game:GetService("SoundService"))
   Sound.SoundId = "rbxassetid://18595195017"
   Sound:Play()
   end, 
})

local Tab = Window:CreateTab("About") -- Title

local Button = Tab:CreateButton({
   Name = "Destroy GUI",
   Callback = function()
   Rayfield:Destroy()
   end,
})

local Paragraph = Tab:CreateParagraph({Title = "by Fian_gg", Content = "Script Maker From Indonesia 🇮🇩"})
