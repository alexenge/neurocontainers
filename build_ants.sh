#!/usr/bin/env bash
set -e

export imageName='ants_2p3p1'

./main_setup.sh

neurodocker generate ${neurodocker_buildMode} \
   --base debian:stretch \
   --pkg-manager apt \
   --run="printf '#!/bin/bash\nls -la' > /usr/bin/ll" \
   --run="chmod +x /usr/bin/ll" \
   --run="mkdir ${mountPointList}" \
   --afni version=2.3.1, \
   --env DEPLOY_PATH=/opt/afni-2.3.1/bin/ \
   --user=neuro \
  > recipe.${imageName}

./main_build.sh
