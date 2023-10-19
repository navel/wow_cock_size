SLASH_COCKSIZE1 = "/cocksize"
SLASH_COCKSIZE2 = "/cs"

function getSmile(size)
    if size < 6 then
        return '{rt1}'
    elseif size < 11 then
        return '{rt2}'
    elseif size < 16 then
        return '{rt3}'
    elseif size < 21 then
        return '{rt4}'
    elseif size < 26 then
        return '{rt5}'
    elseif size < 31 then
        return '{rt6}'
    elseif size < 36 then
        return '{rt7}'
    elseif size > 35 then
        return '{rt8}'
    end
end

function stringToNumber(inputString)
    local hash = 0
    for i = 1, #inputString do
        local charCode = string.byte(inputString, i)
        hash = (hash * 31 + charCode) % 100000
    end
    return (hash + 1) / 100000
end

function dayRand(prefix)
    local curDate = date("%Y%m%d");
    return stringToNumber(prefix .. curDate);
end

function generateGaussianNumber(mean, stdDeviation, u1, u2)
    local z = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
    return mean + stdDeviation * z
end

function randomToNumber(u1, u2)
    local gaussianValue = generateGaussianNumber(15, 5, u1, u2)  -- Среднее значение 15, стандартное отклонение 5
    return math.max(1, math.min(40, math.floor(gaussianValue)))
end

SlashCmdList.COCKSIZE = function(msg, editBox)
    local playerName = UnitName("player");
    local realmName = GetRealmName();
    local cockSize = randomToNumber(dayRand(realmName), dayRand(playerName));
    SendChatMessage("My cock size is " .. cockSize .. 'cm ' .. getSmile(tonumber(cockSize)) , "GUILD");
end