import xbmc
import time

def wait(cond, timeout):
    t = time.time()
    while time.time() - t < timeout:
        if xbmc.getCondVisibility(cond):
            return True
        xbmc.sleep(500)
    return False

def is_playing():
    return (xbmc.getCondVisibility("Player.HasVideo")
            or xbmc.getCondVisibility("Player.HasMedia"))

class AutoPlay(xbmc.Monitor):
    def __init__(self):
        xbmc.Monitor.__init__(self)

        # small startup grace
        xbmc.sleep(3000)

        # wait for network (up to 30s)
        xbmc.log("RUV Autoplay: waiting for network...", xbmc.LOGINFO)
        wait("System.HasNetwork", 30)

        # if something is already playing, do nothing
        if is_playing():
            xbmc.log("RUV Autoplay: playback already active, skipping.", xbmc.LOGINFO)
            return

        # single attempt, then a long wait for the player to lock on
        xbmc.log("RUV Autoplay: starting first PlayMedia...", xbmc.LOGINFO)
        xbmc.executebuiltin("PlayMedia(/storage/ruv_live.strm)")

        if wait("Player.HasVideo", 30):
            xbmc.log("RUV Autoplay: playback started.", xbmc.LOGINFO)
            return

        # If still nothing, do ONE safe retry (only if still not playing)
        if not is_playing():
            xbmc.log("RUV Autoplay: retrying PlayMedia once...", xbmc.LOGINFO)
            xbmc.executebuiltin("PlayMedia(/storage/ruv_live.strm)")
            wait("Player.HasVideo", 20)

AutoPlay()

# keep service alive (no busy loop)
while not xbmc.Monitor().abortRequested():
    xbmc.sleep(1000)
