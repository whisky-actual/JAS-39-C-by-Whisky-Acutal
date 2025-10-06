
CLOCK_ID = {
    WIN_1 = 1,
    WIN_2 = 2,
}

local count = 0
local function counter()
    count = count + 1
    return count
end

------ 子页面
count = 0
-- 子页面ID定义
SUB_PAGE_ID = {
    ELEMENTSET_BASE         = 0,
    ELEMENTSET_PAGE_01      = counter(), --
    ELEMENTSET_PAGE_02      = counter(), --
}

count = 0

-- 页面ID定义
PAGE_ID = {
    PAGE_ID_BASE        = 0,
    PAGE_ID_WIN1        = counter(), --
    PAGE_ID_WIN2        = counter(), --
}
