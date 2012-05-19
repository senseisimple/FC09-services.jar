.class final Lcom/android/server/PackageManagerService$ServiceIntentResolver;
.super Lcom/android/server/IntentResolver;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ServiceIntentResolver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/server/IntentResolver",
        "<",
        "Landroid/content/pm/PackageParser$ServiceIntentInfo;",
        "Landroid/content/pm/ResolveInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private mFlags:I

.field private final mServices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/ComponentName;",
            "Landroid/content/pm/PackageParser$Service;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/server/PackageManagerService;


# direct methods
.method private constructor <init>(Lcom/android/server/PackageManagerService;)V
    .registers 3
    .parameter

    .prologue
    .line 4417
    iput-object p1, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->this$0:Lcom/android/server/PackageManagerService;

    invoke-direct {p0}, Lcom/android/server/IntentResolver;-><init>()V

    .line 4570
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mServices:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/PackageManagerService;Lcom/android/server/PackageManagerService$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 4417
    invoke-direct {p0, p1}, Lcom/android/server/PackageManagerService$ServiceIntentResolver;-><init>(Lcom/android/server/PackageManagerService;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/server/PackageManagerService$ServiceIntentResolver;)Ljava/util/HashMap;
    .registers 2
    .parameter "x0"

    .prologue
    .line 4417
    iget-object v0, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mServices:Ljava/util/HashMap;

    return-object v0
.end method


# virtual methods
.method public final addService(Landroid/content/pm/PackageParser$Service;)V
    .registers 8
    .parameter "s"

    .prologue
    .line 4452
    iget-object v3, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mServices:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/content/pm/PackageParser$Service;->getComponentName()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v3, v4, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4458
    iget-object v3, p1, Landroid/content/pm/PackageParser$Service;->intents:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4460
    .local v0, NI:I
    const/4 v2, 0x0

    .local v2, j:I
    :goto_10
    if-ge v2, v0, :cond_42

    .line 4461
    iget-object v3, p1, Landroid/content/pm/PackageParser$Service;->intents:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageParser$ServiceIntentInfo;

    .line 4466
    .local v1, intent:Landroid/content/pm/PackageParser$ServiceIntentInfo;
    invoke-virtual {v1}, Landroid/content/pm/PackageParser$ServiceIntentInfo;->debugCheck()Z

    move-result v3

    if-nez v3, :cond_3c

    .line 4467
    const-string v3, "PackageManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "==> For Service "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Landroid/content/pm/PackageParser$Service;->info:Landroid/content/pm/ServiceInfo;

    iget-object v5, v5, Landroid/content/pm/ComponentInfo;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 4469
    :cond_3c
    invoke-virtual {p0, v1}, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->addFilter(Landroid/content/IntentFilter;)V

    .line 4460
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 4471
    .end local v1           #intent:Landroid/content/pm/PackageParser$ServiceIntentInfo;
    :cond_42
    return-void
.end method

.method protected bridge synthetic allowFilterResult(Landroid/content/IntentFilter;Ljava/util/List;)Z
    .registers 4
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 4417
    check-cast p1, Landroid/content/pm/PackageParser$ServiceIntentInfo;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->allowFilterResult(Landroid/content/pm/PackageParser$ServiceIntentInfo;Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method protected allowFilterResult(Landroid/content/pm/PackageParser$ServiceIntentInfo;Ljava/util/List;)Z
    .registers 9
    .parameter "filter"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/pm/PackageParser$ServiceIntentInfo;",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p2, dest:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v5, 0x1

    .line 4495
    iget-object v3, p1, Landroid/content/pm/PackageParser$ServiceIntentInfo;->service:Landroid/content/pm/PackageParser$Service;

    iget-object v1, v3, Landroid/content/pm/PackageParser$Service;->info:Landroid/content/pm/ServiceInfo;

    .line 4496
    .local v1, filterSi:Landroid/content/pm/ServiceInfo;
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    sub-int v2, v3, v5

    .end local p0
    .local v2, i:I
    :goto_b
    if-ltz v2, :cond_26

    .line 4497
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/pm/ResolveInfo;

    iget-object v0, p0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 4498
    .local v0, destAi:Landroid/content/pm/ServiceInfo;
    iget-object v3, v0, Landroid/content/pm/ComponentInfo;->name:Ljava/lang/String;

    iget-object v4, v1, Landroid/content/pm/ComponentInfo;->name:Ljava/lang/String;

    if-ne v3, v4, :cond_23

    iget-object v3, v0, Landroid/content/pm/ComponentInfo;->packageName:Ljava/lang/String;

    iget-object v4, v1, Landroid/content/pm/ComponentInfo;->packageName:Ljava/lang/String;

    if-ne v3, v4, :cond_23

    .line 4500
    const/4 v3, 0x0

    .line 4503
    .end local v0           #destAi:Landroid/content/pm/ServiceInfo;
    :goto_22
    return v3

    .line 4496
    .restart local v0       #destAi:Landroid/content/pm/ServiceInfo;
    :cond_23
    add-int/lit8 v2, v2, -0x1

    goto :goto_b

    .end local v0           #destAi:Landroid/content/pm/ServiceInfo;
    :cond_26
    move v3, v5

    .line 4503
    goto :goto_22
.end method

.method protected bridge synthetic dumpFilter(Ljava/io/PrintWriter;Ljava/lang/String;Landroid/content/IntentFilter;)V
    .registers 4
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 4417
    check-cast p3, Landroid/content/pm/PackageParser$ServiceIntentInfo;

    .end local p3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->dumpFilter(Ljava/io/PrintWriter;Ljava/lang/String;Landroid/content/pm/PackageParser$ServiceIntentInfo;)V

    return-void
.end method

.method protected dumpFilter(Ljava/io/PrintWriter;Ljava/lang/String;Landroid/content/pm/PackageParser$ServiceIntentInfo;)V
    .registers 5
    .parameter "out"
    .parameter "prefix"
    .parameter "filter"

    .prologue
    .line 4549
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p3, Landroid/content/pm/PackageParser$ServiceIntentInfo;->service:Landroid/content/pm/PackageParser$Service;

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 4551
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(C)V

    .line 4552
    iget-object v0, p3, Landroid/content/pm/PackageParser$ServiceIntentInfo;->service:Landroid/content/pm/PackageParser$Service;

    invoke-virtual {v0}, Landroid/content/pm/PackageParser$Service;->getComponentShortName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 4553
    const-string v0, " filter "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 4554
    invoke-static {p3}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4555
    return-void
.end method

.method protected newResult(Landroid/content/pm/PackageParser$ServiceIntentInfo;I)Landroid/content/pm/ResolveInfo;
    .registers 10
    .parameter "filter"
    .parameter "match"

    .prologue
    const/4 v6, 0x0

    .line 4514
    move-object v0, p1

    .line 4515
    .local v0, info:Landroid/content/pm/PackageParser$ServiceIntentInfo;
    iget-object v3, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->this$0:Lcom/android/server/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/PackageManagerService;->mSettings:Lcom/android/server/PackageManagerService$Settings;

    iget-object v4, v0, Landroid/content/pm/PackageParser$ServiceIntentInfo;->service:Landroid/content/pm/PackageParser$Service;

    iget-object v4, v4, Landroid/content/pm/PackageParser$Service;->info:Landroid/content/pm/ServiceInfo;

    iget v5, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mFlags:I

    invoke-virtual {v3, v4, v5}, Lcom/android/server/PackageManagerService$Settings;->isEnabledLP(Landroid/content/pm/ComponentInfo;I)Z

    move-result v3

    if-nez v3, :cond_14

    move-object v3, v6

    .line 4538
    :goto_13
    return-object v3

    .line 4518
    :cond_14
    iget-object v2, v0, Landroid/content/pm/PackageParser$ServiceIntentInfo;->service:Landroid/content/pm/PackageParser$Service;

    .line 4519
    .local v2, service:Landroid/content/pm/PackageParser$Service;
    iget-object v3, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->this$0:Lcom/android/server/PackageManagerService;

    iget-boolean v3, v3, Lcom/android/server/PackageManagerService;->mSafeMode:Z

    if-eqz v3, :cond_28

    iget-object v3, v2, Landroid/content/pm/PackageParser$Service;->info:Landroid/content/pm/ServiceInfo;

    iget-object v3, v3, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_28

    move-object v3, v6

    .line 4521
    goto :goto_13

    .line 4523
    :cond_28
    new-instance v1, Landroid/content/pm/ResolveInfo;

    invoke-direct {v1}, Landroid/content/pm/ResolveInfo;-><init>()V

    .line 4524
    .local v1, res:Landroid/content/pm/ResolveInfo;
    iget v3, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mFlags:I

    invoke-static {v2, v3}, Landroid/content/pm/PackageParser;->generateServiceInfo(Landroid/content/pm/PackageParser$Service;I)Landroid/content/pm/ServiceInfo;

    move-result-object v3

    iput-object v3, v1, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 4526
    iget v3, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mFlags:I

    and-int/lit8 v3, v3, 0x40

    if-eqz v3, :cond_3d

    .line 4527
    iput-object p1, v1, Landroid/content/pm/ResolveInfo;->filter:Landroid/content/IntentFilter;

    .line 4529
    :cond_3d
    invoke-virtual {v0}, Landroid/content/pm/PackageParser$ServiceIntentInfo;->getPriority()I

    move-result v3

    iput v3, v1, Landroid/content/pm/ResolveInfo;->priority:I

    .line 4530
    iget-object v3, v2, Landroid/content/pm/PackageParser$Service;->owner:Landroid/content/pm/PackageParser$Package;

    iget v3, v3, Landroid/content/pm/PackageParser$Package;->mPreferredOrder:I

    iput v3, v1, Landroid/content/pm/ResolveInfo;->preferredOrder:I

    .line 4533
    iput p2, v1, Landroid/content/pm/ResolveInfo;->match:I

    .line 4534
    iget-boolean v3, v0, Landroid/content/pm/PackageParser$ServiceIntentInfo;->hasDefault:Z

    iput-boolean v3, v1, Landroid/content/pm/ResolveInfo;->isDefault:Z

    .line 4535
    iget v3, v0, Landroid/content/pm/PackageParser$ServiceIntentInfo;->labelRes:I

    iput v3, v1, Landroid/content/pm/ResolveInfo;->labelRes:I

    .line 4536
    iget-object v3, v0, Landroid/content/pm/PackageParser$ServiceIntentInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    iput-object v3, v1, Landroid/content/pm/ResolveInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    .line 4537
    iget v3, v0, Landroid/content/pm/PackageParser$ServiceIntentInfo;->icon:I

    iput v3, v1, Landroid/content/pm/ResolveInfo;->icon:I

    move-object v3, v1

    .line 4538
    goto :goto_13
.end method

.method protected bridge synthetic newResult(Landroid/content/IntentFilter;I)Ljava/lang/Object;
    .registers 4
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 4417
    check-cast p1, Landroid/content/pm/PackageParser$ServiceIntentInfo;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->newResult(Landroid/content/pm/PackageParser$ServiceIntentInfo;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic packageForFilter(Landroid/content/IntentFilter;)Ljava/lang/String;
    .registers 3
    .parameter "x0"

    .prologue
    .line 4417
    check-cast p1, Landroid/content/pm/PackageParser$ServiceIntentInfo;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->packageForFilter(Landroid/content/pm/PackageParser$ServiceIntentInfo;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected packageForFilter(Landroid/content/pm/PackageParser$ServiceIntentInfo;)Ljava/lang/String;
    .registers 3
    .parameter "info"

    .prologue
    .line 4508
    iget-object v0, p1, Landroid/content/pm/PackageParser$ServiceIntentInfo;->service:Landroid/content/pm/PackageParser$Service;

    iget-object v0, v0, Landroid/content/pm/PackageParser$Service;->owner:Landroid/content/pm/PackageParser$Package;

    iget-object v0, v0, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public queryIntent(Landroid/content/Intent;Ljava/lang/String;I)Ljava/util/List;
    .registers 5
    .parameter "intent"
    .parameter "resolvedType"
    .parameter "flags"

    .prologue
    .line 4425
    iput p3, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mFlags:I

    .line 4426
    const/high16 v0, 0x1

    and-int/2addr v0, p3

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    :goto_8
    invoke-super {p0, p1, p2, v0}, Lcom/android/server/IntentResolver;->queryIntent(Landroid/content/Intent;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public queryIntent(Landroid/content/Intent;Ljava/lang/String;Z)Ljava/util/List;
    .registers 5
    .parameter "intent"
    .parameter "resolvedType"
    .parameter "defaultOnly"

    .prologue
    .line 4420
    if-eqz p3, :cond_b

    const/high16 v0, 0x1

    :goto_4
    iput v0, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mFlags:I

    .line 4421
    invoke-super {p0, p1, p2, p3}, Lcom/android/server/IntentResolver;->queryIntent(Landroid/content/Intent;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 4420
    :cond_b
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public queryIntentForPackage(Landroid/content/Intent;Ljava/lang/String;ILjava/util/ArrayList;)Ljava/util/List;
    .registers 11
    .parameter "intent"
    .parameter "resolvedType"
    .parameter "flags"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/PackageParser$Service;",
            ">;)",
            "Ljava/util/List;"
        }
    .end annotation

    .prologue
    .line 4432
    .local p4, packageServices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageParser$Service;>;"
    if-nez p4, :cond_4

    .line 4433
    const/4 v5, 0x0

    .line 4448
    :goto_3
    return-object v5

    .line 4435
    :cond_4
    iput p3, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mFlags:I

    .line 4436
    const/high16 v5, 0x1

    and-int/2addr v5, p3

    if-eqz v5, :cond_2f

    const/4 v5, 0x1

    move v1, v5

    .line 4437
    .local v1, defaultOnly:Z
    :goto_d
    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4438
    .local v0, N:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 4442
    .local v4, listCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/ArrayList<Landroid/content/pm/PackageParser$ServiceIntentInfo;>;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_17
    if-ge v2, v0, :cond_32

    .line 4443
    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/PackageParser$Service;

    iget-object v3, v5, Landroid/content/pm/PackageParser$Service;->intents:Ljava/util/ArrayList;

    .line 4444
    .local v3, intentFilters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageParser$ServiceIntentInfo;>;"
    if-eqz v3, :cond_2c

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_2c

    .line 4445
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4442
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 4436
    .end local v0           #N:I
    .end local v1           #defaultOnly:Z
    .end local v2           #i:I
    .end local v3           #intentFilters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/pm/PackageParser$ServiceIntentInfo;>;"
    .end local v4           #listCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/ArrayList<Landroid/content/pm/PackageParser$ServiceIntentInfo;>;>;"
    :cond_2f
    const/4 v5, 0x0

    move v1, v5

    goto :goto_d

    .line 4448
    .restart local v0       #N:I
    .restart local v1       #defaultOnly:Z
    .restart local v2       #i:I
    .restart local v4       #listCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/ArrayList<Landroid/content/pm/PackageParser$ServiceIntentInfo;>;>;"
    :cond_32
    invoke-super {p0, p1, p2, v1, v4}, Lcom/android/server/IntentResolver;->queryIntentFromList(Landroid/content/Intent;Ljava/lang/String;ZLjava/util/ArrayList;)Ljava/util/List;

    move-result-object v5

    goto :goto_3
.end method

.method public final removeService(Landroid/content/pm/PackageParser$Service;)V
    .registers 7
    .parameter "s"

    .prologue
    .line 4474
    iget-object v3, p0, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->mServices:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/content/pm/PackageParser$Service;->getComponentName()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4480
    iget-object v3, p1, Landroid/content/pm/PackageParser$Service;->intents:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4482
    .local v0, NI:I
    const/4 v2, 0x0

    .local v2, j:I
    :goto_10
    if-ge v2, v0, :cond_20

    .line 4483
    iget-object v3, p1, Landroid/content/pm/PackageParser$Service;->intents:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageParser$ServiceIntentInfo;

    .line 4488
    .local v1, intent:Landroid/content/pm/PackageParser$ServiceIntentInfo;
    invoke-virtual {p0, v1}, Lcom/android/server/PackageManagerService$ServiceIntentResolver;->removeFilter(Landroid/content/IntentFilter;)V

    .line 4482
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 4490
    .end local v1           #intent:Landroid/content/pm/PackageParser$ServiceIntentInfo;
    :cond_20
    return-void
.end method

.method protected sortResults(Ljava/util/List;)V
    .registers 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4543
    .local p1, results:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-static {}, Lcom/android/server/PackageManagerService;->access$1700()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 4544
    return-void
.end method
