local name_storage = "minecraft:barrel_0"
local builders = {
    {name="Vada I. Colby", x=-279, y=71, z=83},
    {name="Rocky H.Bardolf", x=-272, y=71, z=93}
}
function init()
    local monitor = peripheral.wrap("right")
    monitor.setTextScale(0.5)
    term.redirect(monitor)
    term.setCursorPos(1, 1)
    term.clear()
end
function isNil(str)
    if str == nil then return "nil"
    else return str end
end
function tableCount(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end
function getNeeded(_rq)
    local t = {}
    for _,r in pairs(_rq) do
        if(r.status == "DONT_HAVE") then
            table.insert(t, r)
        end
    end
    return t
end
function printColor(t, c)
    term.setTextColor(c)
    print(t)
    term.setTextColor(colors.white)
end
local args = {...}
if #args < 1 then
    print("Usage: colonyrequest idBuilder")
    for id, builder in pairs(builders) do
        print("id: "..id.." name: ".. builder.name)
    end
    return
end
local idBuilder = tonumber(args[1])
init()
local colony = peripheral.find("colonyIntegrator")
local me = peripheral.find("rsBridge")
local rq = colony.getBuilderResources({x=builders[idBuilder].x, y=builders[idBuilder].y, z=builders[idBuilder].z});
local neededRq = getNeeded(rq)
local nbRq = tableCount(neededRq)
print(nbRq)
for i = 1, nbRq do
    local request = neededRq[i]
    local qtyNeeded = request.needed - request.available
    local infoItemInMe = me.getItem({name=request.item})
    if infoItemInMe.amount <= 100 then infoItemInMe.amount = 0 end
    if next(infoItemInMe) ~= nil then
        if qtyNeeded <= infoItemInMe.amount then
            me.exportItemToPeripheral({name=request.item, count=qtyNeeded}, name_storage)
            printColor(request.item..": Export Sucess", colors.green)
        else
            local qtyToCraft = qtyNeeded - infoItemInMe.amount
            local craftStatus, err = me.craftItem({name=request.item, count=qtyToCraft})
            if not craftStatus then
                printError(request.item..": Can't Craft, error, or no recipe ("..isNil(err)..")")
            else
                while me.isItemCrafting({name=request.item}) do end
                sleep(1)
                me.exportItemToPeripheral({name=request.item, count=qtyNeeded}, name_storage)
                printColor(request.item..": Craft and Export Sucess", colors.green)
            end
        end
    else
        print("name: "..request.item.." qtyNeeded: "..qtyNeeded)
        printColor(request.item..": Can't Craft, no recipe", colors.red)
    end
end
print("Finish")
