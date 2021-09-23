function debug(variable)
    Turbine.PluginData.Save(Turbine.DataScope.Server, "Debug", variable);
end