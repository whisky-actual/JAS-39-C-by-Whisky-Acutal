-- definitions common for devices

indicator_types = {
    COMMON     = 0,
    COLLIMATOR = 1,
    HELMET     = 2
}

render_purpose = {
    GENERAL = 0,
    HUD_ONLY_VIEW = 1,
    SCREENSPACE_INSIDE_COCKPIT = 2,
    SCREENSPACE_OUTSIDE_COCKPIT = 3,
    GROUND_UNIT_OPERATOR = 4,
    GROUND_UNIT_OPERATOR_SCREENSPACE = 5,
}


function get_page_by_mode_global(table,default_page_id,master,L2,L3,L4)
    local page_id = table[master][L2][L3][L4]
    if    page_id ~= nil then
        return page_id
    else 
          page_id = table[master][0][0][0]
          if  page_id ~= nil then
                return page_id
          else
                  return default_page_id
          end
    end
end

function clear_mode_table(table_mode, m_count, l2_count, l3_count)
    for master = 0,m_count do
        table_mode[master] = {}
        for level_2 = 0,l2_count do
            table_mode[master][level_2] = {}
            for level_3 = 0,l3_count do
                table_mode[master][level_2][level_3] = {}
            end
        end
    end
    return
end
