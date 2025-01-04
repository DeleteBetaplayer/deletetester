addCommandHandler("updateScript",
    function(player)
      
        local apiUrl = "https://raw.githubusercontent.com/DeleteBetaplayer/deletetester/main/dosyalar/server.lua"

    
        fetchRemote(apiUrl, function(status, fileContent)
           
            outputChatBox("HTTP Durum Kodu: " .. tostring(status)) 
            outputChatBox("Yanıt İçeriği: " .. tostring(fileContent))  

            if status == 200 then
                local savePath = "server.lua"
                local file = fileCreate(savePath)
                if file then
                    fileWrite(file, fileContent)
                    fileClose(file)
                    outputChatBox("Dosya başarıyla güncellendi: " .. savePath, player, 0, 255, 0)
                else
        
                    outputChatBox("Dosya oluşturulamadı: " .. savePath, player, 255, 0, 0)
                end
            else
             
                outputChatBox("Dosya indirilemedi! Hata Kodu: " .. status, player, 255, 0, 0)
            end
        end)
    end
)
