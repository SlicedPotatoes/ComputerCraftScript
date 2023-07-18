reactor = peripheral.wrap("BiggerReactors_Reactor_0")
power = peripheral.wrap("energyCell_1")
reactorOnLogo = paintutils.loadImage("logo_green.nfp")
reactorOffLogo = paintutils.loadImage("logo_red.nfp")
function init()
    local monitor = peripheral.wrap("left")
    monitor.setTextScale(0.5)
    term.redirect(monitor)
    term.setBackgroundColor(colors.black)
    term.clear()
    local bat = paintutils.loadImage("bat.nfp")
    paintutils.drawImage(bat, 1, 40)
end
function write(text, color, x, y, clear)
    term.setCursorPos(x, y)
    if clear == nil then
        term.setBackgroundColor(colors.black)
        term.clearLine()
    end
    term.setTextColor(color)
    print(text)
end
function centerPrint(data)
    local w, h = term.getSize()
    local stringLength = string.len(data)
    return math.ceil((w / 2) - (stringLength / 2))
end
function drawProgressBatterie(n)
    local xPosStart = 8
    for i = 1, 39 do
        local p = xPosStart + i
        if math.ceil(i*2.56) <= n then
            paintutils.drawLine(p, 42, p, 49, colors.red)
        else
            paintutils.drawLine(p, 42, p, 49, colors.black)
        end
    end
    local dataToPrint = math.ceil(n).."%"
    write(dataToPrint, colors.white, centerPrint(dataToPrint), 38)
end
function writeReactorInfo()
    if reactor.active() then
        paintutils.drawImage(reactorOnLogo, 16, 15)
    else
        paintutils.drawImage(reactorOffLogo, 16, 15)
    end
    local dataToPrint = "Last change state: "..dateState
    write(dataToPrint, colors.white, centerPrint(dataToPrint), 33)
end
function writePowerUsage(timer, powerBefore)
    while true do
        local event, timerID = os.pullEvent("timer")
        if timerID == timer then
            local powerEnd = power.getEnergy()
            local powerPerSecond = powerEnd - powerBefore
            if powerPerSecond < 0 then
                local dataToPrint = "Power per second: "..powerPerSecond
                write(dataToPrint, colors.red, centerPrint(dataToPrint), 3)
            else
                local dataToPrint = "Power per second: +"..powerPerSecond
                write(dataToPrint, colors.green, centerPrint(dataToPrint), 3)
            end
            return
        end
    end
end
function reactorControl(percentage)
    if reactor.active() and percentage >= 80 then
        reactor.setActive(false)
        dateState = os.date("%d/%m %H:%M:%S")
    elseif not reactor.active() and percentage <= 20 then
        reactor.setActive(true)
        dateState = os.date("%d/%m %H:%M:%S")
    end
end
init()

dateState = os.date("%d/%m %H:%M:%S")

while true do
    local timer = os.startTimer(1)
    -- Affichage Batterie
    local p = power.getEnergy()
    local maxP = power.getMaxEnergy()
    local percentage = p / maxP * 100
    drawProgressBatterie(percentage)
    reactorControl(percentage)
    writeReactorInfo()
    writePowerUsage(timer, p)
end