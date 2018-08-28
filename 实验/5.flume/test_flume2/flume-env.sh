HTTP_MONITORING_PORT=34459
export JAVA_OPTS="$JAVA_OPTS -Xms512m -Xmx512m -Dflume.project.dir=$opt_conf -Dflume.monitoring.type=http -Dflume.monitoring.port=$HTTP_MONITORING_PORT"

# Note that the Flume conf directory is always included in the classpath.
# load plugins.d directories of pwd
PWD_BEFORE="$(pwd)"

if [[ -n "$opt_conf" && -d "$opt_conf" && -d "$opt_conf/plugins.d" ]] ; then
  PWD_PWD_PLUGINS_DIRS=$(cd "$opt_conf/plugins.d"; pwd)

  unset pwd_plugin_lib pwd_plugin_libext pwd_plugin_native
  for PWD_PLUGINS_DIR in $PWD_PWD_PLUGINS_DIRS; do
    if [[ -d ${PWD_PLUGINS_DIR} ]]; then
    for plugin in ${PWD_PLUGINS_DIR}/*; do
      if [[ -d "$plugin/lib" ]]; then
      pwd_plugin_lib="${pwd_plugin_lib}${pwd_plugin_lib+:}${plugin}/lib/*"
      fi
      if [[ -d "$plugin/libext" ]]; then
      pwd_plugin_libext="${pwd_plugin_libext}${pwd_plugin_libext+:}${plugin}/libext/*"
      fi
      if [[ -d "$plugin/native" ]]; then
      pwd_plugin_native="${pwd_plugin_native}${pwd_plugin_native+:}${plugin}/native"
      fi
    done
    fi
  done

  if [[ -n "${pwd_plugin_lib}" ]]
  then
    FLUME_CLASSPATH="${pwd_plugin_lib}"
  fi

  if [[ -n "${pwd_plugin_libext}" ]]
  then
    FLUME_CLASSPATH="${FLUME_CLASSPATH}:${pwd_plugin_libext}"
  fi

  if [[ -n "${pwd_plugin_native}" ]]
  then
    FLUME_JAVA_LIBRARY_PATH="${pwd_plugin_native}"
  fi
fi

cd "$PWD_BEFORE"
echo $FLUME_CLASSPATH
echo $FLUME_JAVA_LIBRARY_PATH
