function debug(var)
    Turbine.PluginData.Save(Turbine.DataScope.Server, "debug", var);
end