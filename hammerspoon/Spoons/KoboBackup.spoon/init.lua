local obj={}
local spoonName = "KoboBackup"

local logger = hs.logger.new(spoonName)
obj.logger = logger

local koboMountPath = "/Volumes/KOBOeReader"
local backupDirectoryBase = os.getenv("HOME") .. "/Documents/Backup/Kobo/fs"
local pendingTask = nil
local restartBackup = false

function obj:log(message)
  hs.notify.new():title(spoonName):subTitle(message):send()
  obj.logger.w(message)
end

function obj:backup()
  if hs.fs.volume.allVolumes()[koboMountPath] == nil then
    obj:log("Kobo volume unmounted; skipping backup")
  elseif pendingTask == nil then
    local startTime = hs.timer.absoluteTime()
    local backupDirectory = backupDirectoryBase .. os.date("/%Y-%m-%d_%H-%M-%S/");
    pendingTask = hs.task.new("/usr/bin/rsync", function()
      pendingTask = nil
      if restartBackup then
        obj:log("Kobo backup restarting...")
        restartBackup = false
        obj.backup()
      else
        local endTime = hs.timer.absoluteTime()
        local diffInSeconds = math.floor((endTime - startTime) / 1000000 / 1000)
        obj:log("Kobo backup finished in " .. diffInSeconds .. "s\n\n" .. backupDirectory)
      end
    end, {
      "--archive",
      "--update",
      "--delete",
      "--exclude",
      ".Trashes",
      "--exclude",
      ".Spotlight-V100",
      koboMountPath .. "/",
      backupDirectory,
    }):start()
    obj:log("Kobo backup started")
  else
    restartBackup = true
    obj:log("Kobo backup invalidated due to file system change")
  end
end

function obj:watch()
  koboPathwatcher = hs.pathwatcher.new(koboMountPath, obj.backup):start()
  obj.backup()
end

return obj
