if remotes then
    for _, child in pairs(remotes:GetChildren()) do
        print("RemoteEvent ditemukan:", child.Name)
    end
end
