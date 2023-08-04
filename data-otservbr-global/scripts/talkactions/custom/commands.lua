local commands = TalkAction("!commands")
 
function commands.onSay(player, words, param)
    if player then
        local text = 'Comandos disponiveis: \n\n'
        text = text .. '!aol \n'
        text = text .. '!bless \n'
        text = text .. '!buyhouse \n'
        text = text .. '!leavehouse \n'
        text = text .. '!online \n'
        text = text .. '!sellhouse \n'
        text = text .. '!serverinfo \n'
		text = text .. '!reset \n'
		text = text .. '!premium \n'
		text = text .. '!jobs \n'
		text = text .. '!guildOutfit \n'
		text = text .. '!tools \n'
		text = text .. '!spells \n'
		text = text .. '!addondoll \n'
		text = text .. '!mountdoll \n'
		text = text .. '!vip \n'
		text = text .. '!bp \n'
		text = text .. '!mounts \n'
		text = text .. '!reward \n'
		text = text .. '!food \n'
		text = text .. '!emote \n'
		text = text .. '!go \n'
		text = text .. '!bosscheck \n'
		text = text .. '!!shared \n'
		text = text .. '!!shareparty \n'
        text = text .. '!tibiatimer \n\n'
        player:showTextDialog(28887, text)
    end
    return false
end
 
commands:register()