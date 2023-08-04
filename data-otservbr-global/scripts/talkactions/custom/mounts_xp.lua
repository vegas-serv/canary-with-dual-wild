local mountsxp = TalkAction("!mounts")
 
function mountsxp.onSay(player, words, param)
    if player then
        local text = 'EXP MOUNTS: \n\n'
        text = text .. 'Blazebringer: 50% \n'
        text = text .. 'Noxious Ripptor: 80% \n'
        text = text .. 'Singeing Steed: 80% \n'
        text = text .. 'Phantasmal Jade: 80% \n'
        text = text .. 'Phant: 100% \n'
        text = text .. 'Foxmouse: 70% \n'
        text = text .. 'Darkfire: 150% \n'
		text = text .. 'Spirit of Purity: 70% \n'
        player:showTextDialog(28887, text)
    end
    return false
end
 
mountsxp:register()