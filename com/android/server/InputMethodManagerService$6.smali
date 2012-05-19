.class Lcom/android/server/InputMethodManagerService$6;
.super Ljava/lang/Object;
.source "InputMethodManagerService.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/InputMethodManagerService;->showCursorControllerSearchDialogInner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/InputMethodManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/InputMethodManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 1876
    iput-object p1, p0, Lcom/android/server/InputMethodManagerService$6;->this$0:Lcom/android/server/InputMethodManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 7
    .parameter "dialog"
    .parameter "item"

    .prologue
    .line 1878
    const/4 v1, 0x0

    .line 1880
    .local v1, query:Ljava/lang/String;
    packed-switch p2, :pswitch_data_52

    .line 1895
    :goto_4
    if-eqz v1, :cond_2e

    .line 1896
    const-string v2, "%s"

    iget-object v3, p0, Lcom/android/server/InputMethodManagerService$6;->this$0:Lcom/android/server/InputMethodManagerService;

    #getter for: Lcom/android/server/InputMethodManagerService;->mSearchText:Ljava/lang/String;
    invoke-static {v3}, Lcom/android/server/InputMethodManagerService;->access$100(Lcom/android/server/InputMethodManagerService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 1897
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1898
    .local v0, intentSearchText:Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/Intent;->getFlags()I

    move-result v2

    const/high16 v3, 0x1000

    or-int/2addr v2, v3

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1900
    :try_start_27
    iget-object v2, p0, Lcom/android/server/InputMethodManagerService$6;->this$0:Lcom/android/server/InputMethodManagerService;

    iget-object v2, v2, Lcom/android/server/InputMethodManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2e
    .catch Landroid/content/ActivityNotFoundException; {:try_start_27 .. :try_end_2e} :catch_4f

    .line 1904
    .end local v0           #intentSearchText:Landroid/content/Intent;
    :cond_2e
    :goto_2e
    return-void

    .line 1882
    :pswitch_2f
    new-instance v1, Ljava/lang/String;

    .end local v1           #query:Ljava/lang/String;
    const-string v2, "http://www.google.com/m?q=%s"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 1883
    .restart local v1       #query:Ljava/lang/String;
    goto :goto_4

    .line 1885
    :pswitch_37
    new-instance v1, Ljava/lang/String;

    .end local v1           #query:Ljava/lang/String;
    const-string v2, "http://translate.google.com/m?hl=en&sl=auto&tl=en&prev=_m&q=%s"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 1886
    .restart local v1       #query:Ljava/lang/String;
    goto :goto_4

    .line 1888
    :pswitch_3f
    new-instance v1, Ljava/lang/String;

    .end local v1           #query:Ljava/lang/String;
    const-string v2, "http://en.wikipedia.org/w/index.php?search=%s&go=Go"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 1889
    .restart local v1       #query:Ljava/lang/String;
    goto :goto_4

    .line 1891
    :pswitch_47
    new-instance v1, Ljava/lang/String;

    .end local v1           #query:Ljava/lang/String;
    const-string v2, "http://dictionary.reference.com/search?q=%s"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .restart local v1       #query:Ljava/lang/String;
    goto :goto_4

    .line 1901
    .restart local v0       #intentSearchText:Landroid/content/Intent;
    :catch_4f
    move-exception v2

    goto :goto_2e

    .line 1880
    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_37
        :pswitch_3f
        :pswitch_47
    .end packed-switch
.end method
