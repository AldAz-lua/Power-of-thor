next_token = string.gmatch(io.read(), "[^%s]+")
LX = tonumber(next_token()) -- Position initiale du personnage
LY = tonumber(next_token())
TX = tonumber(next_token()) -- Position de la cible
TY = tonumber(next_token())

-- Boucle du jeu
while true do
    remainingTurns = tonumber(io.read())

    -- Calcul de la direction
    local direction = ""

    if LY > TY then
        direction = direction .. "S"
        LY = LY - 1
    elseif LY < TY then
        direction = direction .. "N"
        LY = LY + 1
    end

    if LX > TX then
        direction = direction .. "E"
        LX = LX - 1
    elseif LX < TX then
        direction = direction .. "W"
        LX = LX + 1
    end

    -- Afficher la direction du tour
    print(direction)

    -- Calcul de la distance (hypoténuse)
    local absX = math.abs(LX - TX)
    local absY = math.abs(LY - TY)
    local distance = math.sqrt(absX^2 + absY^2)

    -- Afficher la distance restante
    io.stderr:write("Distance restante : ", string.format("%.2f", distance), "\n")

    -- Optionnel : arrêter la boucle si on est arrivé
    if distance == 0 then
        break
    end
end
