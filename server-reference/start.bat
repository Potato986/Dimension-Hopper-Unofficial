@echo off
java -server -Xmx8G -Xms8G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1HeapRegionSize=8M -XX:+ParallelRefProcEnabled -jar forge.jar nogui

pause