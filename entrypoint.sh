#!/bin/bash
set -e

# Railsの既存のserver.pidを削除
rm -f /buisiness-quiz-app/tmp/pids/server.pid

# コンテナのメインプロセス (DockerfileでCMDとして設定されているもの) を実行
exec "$@"
