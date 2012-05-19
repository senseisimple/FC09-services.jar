.class Lcom/android/server/usb/UsbService$1;
.super Landroid/os/UEventObserver;
.source "UsbService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/usb/UsbService;


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbService;)V
    .registers 2
    .parameter

    .prologue
    .line 145
    iput-object p1, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    invoke-direct {p0}, Landroid/os/UEventObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onUEvent(Landroid/os/UEventObserver$UEvent;)V
    .registers 15
    .parameter "event"

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    const-string v8, "1"

    .line 148
    invoke-static {}, Lcom/android/server/usb/UsbService;->access$000()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_2c

    .line 149
    invoke-static {}, Lcom/android/server/usb/UsbService;->access$000()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "USB UEVENT: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Landroid/os/UEventObserver$UEvent;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :cond_2c
    iget-object v8, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    #getter for: Lcom/android/server/usb/UsbService;->mLock:Ljava/lang/Object;
    invoke-static {v8}, Lcom/android/server/usb/UsbService;->access$100(Lcom/android/server/usb/UsbService;)Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 153
    :try_start_33
    const-string v9, "SWITCH_NAME"

    invoke-virtual {p1, v9}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 154
    .local v5, name:Ljava/lang/String;
    const-string v9, "SWITCH_STATE"

    invoke-virtual {p1, v9}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3e
    .catchall {:try_start_33 .. :try_end_3e} :catchall_98

    move-result-object v6

    .line 155
    .local v6, state:Ljava/lang/String;
    if-eqz v5, :cond_9b

    if-eqz v6, :cond_9b

    .line 167
    :try_start_43
    const-string v9, "usb_configuration"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_75

    .line 168
    const-string v9, "1"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_77

    .line 169
    const/4 v3, 0x1

    .line 174
    .local v3, intState:I
    :goto_54
    iget-object v9, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    iget-object v10, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    #setter for: Lcom/android/server/usb/UsbService;->mConfiguration:I
    invoke-static {v10, v3}, Lcom/android/server/usb/UsbService;->access$302(Lcom/android/server/usb/UsbService;I)I

    move-result v10

    #setter for: Lcom/android/server/usb/UsbService;->mConnected:I
    invoke-static {v9, v10}, Lcom/android/server/usb/UsbService;->access$202(Lcom/android/server/usb/UsbService;I)I

    .line 178
    iget-object v9, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    #getter for: Lcom/android/server/usb/UsbService;->mSystemReady:Z
    invoke-static {v9}, Lcom/android/server/usb/UsbService;->access$400(Lcom/android/server/usb/UsbService;)Z

    move-result v9

    if-eqz v9, :cond_75

    .line 179
    iget-object v9, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    iget-object v10, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    #getter for: Lcom/android/server/usb/UsbService;->mConnected:I
    invoke-static {v10}, Lcom/android/server/usb/UsbService;->access$200(Lcom/android/server/usb/UsbService;)I

    move-result v10

    if-nez v10, :cond_79

    move v10, v11

    :goto_72
    #calls: Lcom/android/server/usb/UsbService;->update(Z)V
    invoke-static {v9, v10}, Lcom/android/server/usb/UsbService;->access$500(Lcom/android/server/usb/UsbService;Z)V
    :try_end_75
    .catchall {:try_start_43 .. :try_end_75} :catchall_98
    .catch Ljava/lang/NumberFormatException; {:try_start_43 .. :try_end_75} :catch_7b

    .line 198
    .end local v3           #intState:I
    :cond_75
    :goto_75
    :try_start_75
    monitor-exit v8

    .line 199
    return-void

    .line 172
    :cond_77
    const/4 v3, 0x0

    .restart local v3       #intState:I
    goto :goto_54

    .line 179
    :cond_79
    const/4 v10, 0x0

    goto :goto_72

    .line 182
    .end local v3           #intState:I
    :catch_7b
    move-exception v9

    move-object v0, v9

    .line 183
    .local v0, e:Ljava/lang/NumberFormatException;
    invoke-static {}, Lcom/android/server/usb/UsbService;->access$000()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Could not parse switch state from event "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_75

    .line 198
    .end local v0           #e:Ljava/lang/NumberFormatException;
    .end local v5           #name:Ljava/lang/String;
    .end local v6           #state:Ljava/lang/String;
    :catchall_98
    move-exception v9

    monitor-exit v8
    :try_end_9a
    .catchall {:try_start_75 .. :try_end_9a} :catchall_98

    throw v9

    .line 186
    .restart local v5       #name:Ljava/lang/String;
    .restart local v6       #state:Ljava/lang/String;
    :cond_9b
    :try_start_9b
    const-string v9, "FUNCTION"

    invoke-virtual {p1, v9}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 187
    .local v2, function:Ljava/lang/String;
    const-string v9, "ENABLED"

    invoke-virtual {p1, v9}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, enabledStr:Ljava/lang/String;
    if-eqz v2, :cond_75

    if-eqz v1, :cond_75

    .line 191
    const-string v9, "1"

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_ca

    move v7, v11

    .line 193
    .local v7, what:I
    :goto_b4
    iget-object v9, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    #getter for: Lcom/android/server/usb/UsbService;->mHandler:Landroid/os/Handler;
    invoke-static {v9}, Lcom/android/server/usb/UsbService;->access$600(Lcom/android/server/usb/UsbService;)Landroid/os/Handler;

    move-result-object v9

    invoke-static {v9, v7}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    .line 194
    .local v4, msg:Landroid/os/Message;
    iput-object v2, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 195
    iget-object v9, p0, Lcom/android/server/usb/UsbService$1;->this$0:Lcom/android/server/usb/UsbService;

    #getter for: Lcom/android/server/usb/UsbService;->mHandler:Landroid/os/Handler;
    invoke-static {v9}, Lcom/android/server/usb/UsbService;->access$600(Lcom/android/server/usb/UsbService;)Landroid/os/Handler;

    move-result-object v9

    invoke-virtual {v9, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_c9
    .catchall {:try_start_9b .. :try_end_c9} :catchall_98

    goto :goto_75

    .end local v4           #msg:Landroid/os/Message;
    .end local v7           #what:I
    :cond_ca
    move v7, v12

    .line 191
    goto :goto_b4
.end method
