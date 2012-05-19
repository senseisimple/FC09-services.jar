.class Lcom/android/server/enterprise/SettingsUtils;
.super Ljava/lang/Object;
.source "SettingsUtils.java"


# static fields
.field private static final ACCOUNT_CONTENT_URI:Landroid/net/Uri; = null

.field private static final HOST_AUTH_CONTENT_URI:Landroid/net/Uri; = null

.field private static final TAG:Ljava/lang/String; = "SettingsUtils"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-string v0, "content://com.android.email.provider/account"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    .line 29
    const-string v0, "content://com.android.email.provider/hostauth"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/server/enterprise/SettingsUtils;->HOST_AUTH_CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized createNewAccount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;BBLjava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLandroid/app/enterprise/Account;Landroid/content/Context;)J
    .registers 75
    .parameter "displayName"
    .parameter "emailAddress"
    .parameter "easUser"
    .parameter "easDomain"
    .parameter "syncLookback"
    .parameter "syncInterval"
    .parameter "isDefault"
    .parameter "senderName"
    .parameter "protocolVersion"
    .parameter "signature"
    .parameter "emailNotificationVibrateAlways"
    .parameter "emailNotificationVibrateWhenSilent"
    .parameter "inComingProtocol"
    .parameter "inComingServerAddress"
    .parameter "inComingServerPort"
    .parameter "inComingServerUseSSL"
    .parameter "inComingServerUseTLS"
    .parameter "inComingServerAcceptAllCertificates"
    .parameter "inComingServerLogin"
    .parameter "inComingServerPassword"
    .parameter "inComingServerPathPrefix"
    .parameter "outGoingProtocol"
    .parameter "outGoingServerAddress"
    .parameter "outGoingServerPort"
    .parameter "outGoingServerUseSSL"
    .parameter "outGoingServerUseTLS"
    .parameter "outGoingServerAcceptAllCertificates"
    .parameter "outGoingServerLogin"
    .parameter "outGoingServerPassword"
    .parameter "outGoingServerPathPrefix"
    .parameter "isEasAccount"
    .parameter "isInsertOP"
    .parameter "existingAccInfo"
    .parameter "mContext"

    .prologue
    .line 387
    const-class v40, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v40

    const-wide/16 v36, -0x1

    .line 388
    .local v36, accountId:J
    :try_start_5
    const-string v5, "SettingsUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "createNewAccount : Processing account "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz p31, :cond_fe

    const-string v7, "creation"

    :goto_16
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " request for EmailId: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object v0, v6

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " (AccountType is : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz p30, :cond_102

    const-string v7, "Eas"

    :goto_31
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " )"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    invoke-static/range {p0 .. p0}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 392
    invoke-static/range {p1 .. p1}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 393
    invoke-static/range {p2 .. p2}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 394
    invoke-static/range {p3 .. p3}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 395
    invoke-static/range {p7 .. p7}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p7

    .line 396
    invoke-static/range {p8 .. p8}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p8

    .line 397
    invoke-static/range {p9 .. p9}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p9

    .line 399
    invoke-static/range {p12 .. p12}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p12

    .line 400
    invoke-static/range {p13 .. p13}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p13

    .line 401
    invoke-static/range {p18 .. p18}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p18

    .line 402
    invoke-static/range {p19 .. p19}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p19

    .line 403
    invoke-static/range {p20 .. p20}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p20

    .line 405
    invoke-static/range {p21 .. p21}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p21

    .line 406
    invoke-static/range {p22 .. p22}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p22

    .line 407
    invoke-static/range {p27 .. p27}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p27

    .line 408
    invoke-static/range {p28 .. p28}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p28

    .line 409
    invoke-static/range {p29 .. p29}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p29

    .line 411
    if-eqz p31, :cond_106

    const/4 v5, 0x0

    move v13, v5

    .line 412
    .local v13, inComingServerAuthFlags:I
    :goto_8a
    if-eqz p31, :cond_110

    const/4 v5, 0x0

    move/from16 v16, v5

    .line 413
    .local v16, outGoingServerAuthFlags:I
    :goto_8f
    const/16 v24, 0x0

    .line 414
    .local v24, compatibilityUuid:Ljava/lang/String;
    if-eqz p31, :cond_11b

    const/4 v5, 0x0

    move/from16 v22, v5

    .line 415
    .local v22, settingsFlags:I
    :goto_96
    const/16 v29, 0x0

    .line 416
    .local v29, securityFlags:I
    const/16 v28, 0x0

    .line 417
    .local v28, newMessageCount:I
    const/16 v30, 0x0

    .line 418
    .local v30, securitySyncKey:Ljava/lang/String;
    const/16 v23, 0x0

    .line 420
    .local v23, syncKey:Ljava/lang/String;
    if-eqz p0, :cond_e8

    if-eqz p1, :cond_e8

    invoke-static/range {p1 .. p1}, Lcom/android/server/enterprise/SettingsUtils;->isValidEmailAddress(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_e8

    if-eqz p30, :cond_ac

    if-eqz p2, :cond_e8

    :cond_ac
    if-eqz p30, :cond_b0

    if-eqz p3, :cond_e8

    :cond_b0
    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p4

    if-gt v0, v1, :cond_e8

    const/4 v5, 0x5

    move v0, v5

    move/from16 v1, p4

    if-lt v0, v1, :cond_e8

    if-eqz p30, :cond_c0

    if-eqz p8, :cond_e8

    :cond_c0
    if-nez p30, :cond_c4

    if-eqz p12, :cond_e8

    :cond_c4
    if-eqz p13, :cond_e8

    if-nez p30, :cond_ca

    if-eqz p18, :cond_e8

    :cond_ca
    if-eqz p19, :cond_e8

    if-nez p30, :cond_d4

    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p14

    if-gt v0, v1, :cond_e8

    :cond_d4
    if-nez p30, :cond_d8

    if-eqz p21, :cond_e8

    :cond_d8
    if-eqz p22, :cond_e8

    if-nez p30, :cond_de

    if-eqz p27, :cond_e8

    :cond_de
    if-eqz p28, :cond_e8

    if-nez p30, :cond_124

    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p23

    if-le v0, v1, :cond_124

    .line 426
    :cond_e8
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p4, "createNewAccount : Error :: Invalid input parameters."

    .end local p4
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f3
    .catchall {:try_start_5 .. :try_end_f3} :catchall_406

    move-object/from16 v15, v23

    .end local v23           #syncKey:Ljava/lang/String;
    .local v15, syncKey:Ljava/lang/String;
    move/from16 v12, v16

    .end local v16           #outGoingServerAuthFlags:I
    .local v12, outGoingServerAuthFlags:I
    move v8, v13

    .end local v13           #inComingServerAuthFlags:I
    .local v8, inComingServerAuthFlags:I
    move-wide/from16 p0, v36

    .end local v36           #accountId:J
    .end local p1
    .local p0, accountId:J
    move-wide/from16 p2, v36

    .line 533
    .end local p0           #accountId:J
    .end local p3
    .end local p5
    .end local p6
    .end local p10
    .end local p11
    .end local p14
    .end local p15
    .end local p16
    .end local p17
    .local p2, accountId:J
    :goto_fc
    monitor-exit v40

    return-wide p2

    .line 388
    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .end local v22           #settingsFlags:I
    .end local v24           #compatibilityUuid:Ljava/lang/String;
    .end local v28           #newMessageCount:I
    .end local v29           #securityFlags:I
    .end local v30           #securitySyncKey:Ljava/lang/String;
    .restart local v36       #accountId:J
    .local p0, displayName:Ljava/lang/String;
    .restart local p1
    .local p2, easUser:Ljava/lang/String;
    .restart local p3
    .restart local p4
    .restart local p5
    .restart local p6
    .restart local p10
    .restart local p11
    .restart local p14
    .restart local p15
    .restart local p16
    .restart local p17
    :cond_fe
    :try_start_fe
    const-string v7, "updation"

    goto/16 :goto_16

    :cond_102
    const-string v7, "Non-Eas"

    goto/16 :goto_31

    .line 411
    :cond_106
    move-object/from16 v0, p32

    iget-object v0, v0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    move-object v5, v0

    iget v5, v5, Landroid/app/enterprise/HostAuth;->mFlags:I

    move v13, v5

    goto/16 :goto_8a

    .line 412
    .restart local v13       #inComingServerAuthFlags:I
    :cond_110
    move-object/from16 v0, p32

    iget-object v0, v0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    move-object v5, v0

    iget v5, v5, Landroid/app/enterprise/HostAuth;->mFlags:I

    move/from16 v16, v5

    goto/16 :goto_8f

    .line 414
    .restart local v16       #outGoingServerAuthFlags:I
    .restart local v24       #compatibilityUuid:Ljava/lang/String;
    :cond_11b
    move-object/from16 v0, p32

    iget v0, v0, Landroid/app/enterprise/Account;->mFlags:I

    move v5, v0

    move/from16 v22, v5

    goto/16 :goto_96

    .line 430
    .restart local v22       #settingsFlags:I
    .restart local v23       #syncKey:Ljava/lang/String;
    .restart local v28       #newMessageCount:I
    .restart local v29       #securityFlags:I
    .restart local v30       #securitySyncKey:Ljava/lang/String;
    :cond_124
    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p10

    if-ne v0, v1, :cond_145

    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p11

    if-ne v0, v1, :cond_145

    .line 431
    const-string p0, "SettingsUtils"

    .end local p0           #displayName:Ljava/lang/String;
    const-string p4, "createNewAccount : Error :: Invalid input parameters. From the arguments \'emailNotificationVibrateAlways\' and \'emailNotificationVibrateWhenSilent\' only one will be true at a time"

    .end local p4
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v15, v23

    .end local v23           #syncKey:Ljava/lang/String;
    .restart local v15       #syncKey:Ljava/lang/String;
    move/from16 v12, v16

    .end local v16           #outGoingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    move v8, v13

    .end local v13           #inComingServerAuthFlags:I
    .restart local v8       #inComingServerAuthFlags:I
    move-wide/from16 p0, v36

    .end local v36           #accountId:J
    .end local p1
    .local p0, accountId:J
    move-wide/from16 p2, v36

    .line 433
    .end local p0           #accountId:J
    .end local p3
    .local p2, accountId:J
    goto :goto_fc

    .line 436
    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .restart local v13       #inComingServerAuthFlags:I
    .restart local v16       #outGoingServerAuthFlags:I
    .restart local v23       #syncKey:Ljava/lang/String;
    .restart local v36       #accountId:J
    .local p0, displayName:Ljava/lang/String;
    .restart local p1
    .local p2, easUser:Ljava/lang/String;
    .restart local p3
    .restart local p4
    :cond_145
    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p15

    if-ne v0, v1, :cond_166

    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p16

    if-ne v0, v1, :cond_166

    .line 437
    const-string p0, "SettingsUtils"

    .end local p0           #displayName:Ljava/lang/String;
    const-string p4, "createNewAccount : Error :: Invalid input parameters. From the arguments \'inComingServerUseSSL\' and \'inComingServerUseTLS\' only one will be true at a time"

    .end local p4
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v15, v23

    .end local v23           #syncKey:Ljava/lang/String;
    .restart local v15       #syncKey:Ljava/lang/String;
    move/from16 v12, v16

    .end local v16           #outGoingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    move v8, v13

    .end local v13           #inComingServerAuthFlags:I
    .restart local v8       #inComingServerAuthFlags:I
    move-wide/from16 p0, v36

    .end local v36           #accountId:J
    .end local p1
    .local p0, accountId:J
    move-wide/from16 p2, v36

    .line 438
    .end local p0           #accountId:J
    .end local p3
    .local p2, accountId:J
    goto :goto_fc

    .line 441
    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .restart local v13       #inComingServerAuthFlags:I
    .restart local v16       #outGoingServerAuthFlags:I
    .restart local v23       #syncKey:Ljava/lang/String;
    .restart local v36       #accountId:J
    .local p0, displayName:Ljava/lang/String;
    .restart local p1
    .local p2, easUser:Ljava/lang/String;
    .restart local p3
    .restart local p4
    :cond_166
    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p24

    if-ne v0, v1, :cond_188

    const/4 v5, 0x1

    move v0, v5

    move/from16 v1, p25

    if-ne v0, v1, :cond_188

    .line 442
    const-string p0, "SettingsUtils"

    .end local p0           #displayName:Ljava/lang/String;
    const-string p4, "createNewAccount : Error :: Invalid input parameters. From the arguments \'outGoingServerUseSSL\' and \'outGoingServerUseTLS\' only one will be true at a time"

    .end local p4
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v15, v23

    .end local v23           #syncKey:Ljava/lang/String;
    .restart local v15       #syncKey:Ljava/lang/String;
    move/from16 v12, v16

    .end local v16           #outGoingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    move v8, v13

    .end local v13           #inComingServerAuthFlags:I
    .restart local v8       #inComingServerAuthFlags:I
    move-wide/from16 p0, v36

    .end local v36           #accountId:J
    .end local p1
    .local p0, accountId:J
    move-wide/from16 p2, v36

    .line 443
    .end local p0           #accountId:J
    .end local p3
    .local p2, accountId:J
    goto/16 :goto_fc

    .line 446
    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .restart local v13       #inComingServerAuthFlags:I
    .restart local v16       #outGoingServerAuthFlags:I
    .restart local v23       #syncKey:Ljava/lang/String;
    .restart local v36       #accountId:J
    .local p0, displayName:Ljava/lang/String;
    .restart local p1
    .local p2, easUser:Ljava/lang/String;
    .restart local p3
    .restart local p4
    :cond_188
    const-wide/16 v5, -0x1

    .line 447
    .local v5, accountsRowId:J
    const-wide/16 v11, -0x1

    .line 448
    .local v11, inComingRowId:J
    const-wide/16 v20, -0x1

    .line 450
    .local v20, outGoingRowId:J
    if-eqz p30, :cond_425

    .line 451
    const-string v6, "com.android.exchange"

    if-eqz p19, :cond_31d

    move-object/from16 v7, p19

    :goto_196
    move-object/from16 v5, p1

    move/from16 v8, p31

    move-object/from16 v9, p32

    move-object/from16 v10, p33

    invoke-static/range {v5 .. v10}, Lcom/android/server/enterprise/SettingsUtils;->insertAccountsTableRow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/app/enterprise/Account;Landroid/content/Context;)J

    .end local v5           #accountsRowId:J
    move-result-wide v5

    .restart local v5       #accountsRowId:J
    move-wide/from16 v38, v5

    .line 454
    .end local v5           #accountsRowId:J
    .local v38, accountsRowId:J
    :goto_1a4
    if-eqz p30, :cond_1ac

    const-wide/16 v5, -0x1

    cmp-long v5, v5, v38

    if-nez v5, :cond_1ae

    :cond_1ac
    if-nez p30, :cond_41a

    .line 456
    :cond_1ae
    if-eqz p31, :cond_321

    const/4 v5, 0x4

    :goto_1b1
    move v0, v5

    move/from16 v1, p15

    move/from16 v2, p16

    move/from16 v3, p17

    move-object/from16 v4, p33

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/SettingsUtils;->getHostAuthFlags(IBBBLandroid/content/Context;)I

    move-result v8

    .line 457
    .end local v13           #inComingServerAuthFlags:I
    .restart local v8       #inComingServerAuthFlags:I
    new-instance p15, Ljava/lang/StringBuilder;

    .end local p15
    invoke-direct/range {p15 .. p15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p15

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p15

    const-string p16, "\\"

    .end local p16
    invoke-virtual/range {p15 .. p16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p15

    move-object/from16 v0, p15

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p15

    invoke-virtual/range {p15 .. p15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p15

    .line 459
    .local p15, easLogin:Ljava/lang/String;
    if-eqz p30, :cond_324

    const-string p16, "eas"

    move-object/from16 v5, p16

    :goto_1e3
    if-eqz p30, :cond_328

    const/16 p14, 0x0

    move/from16 v7, p14

    .end local p14
    :goto_1e9
    if-eqz p30, :cond_32c

    move-object/from16 v9, p15

    :goto_1ed
    const/4 v14, 0x1

    move-object/from16 v6, p13

    move-object/from16 v10, p19

    move-object/from16 v11, p20

    move/from16 v12, p31

    move-object/from16 v13, p32

    move-object/from16 v15, p33

    invoke-static/range {v5 .. v15}, Lcom/android/server/enterprise/SettingsUtils;->insertHostAuthTableRow(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/app/enterprise/Account;ZLandroid/content/Context;)J

    .end local v11           #inComingRowId:J
    move-result-wide p16

    .line 461
    .end local p17
    .local p16, inComingRowId:J
    const-wide/16 v5, -0x1

    cmp-long p14, v5, p16

    if-eqz p14, :cond_416

    .line 463
    if-eqz p31, :cond_330

    const/16 p14, 0x4

    :goto_208
    move/from16 v0, p14

    move/from16 v1, p24

    move/from16 v2, p25

    move/from16 v3, p26

    move-object/from16 v4, p33

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/SettingsUtils;->getHostAuthFlags(IBBBLandroid/content/Context;)I

    move-result v12

    .line 465
    .end local v16           #outGoingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    if-eqz p30, :cond_334

    const-string p14, "eas"

    move-object/from16 v9, p14

    :goto_21c
    if-eqz p30, :cond_338

    const/16 p14, 0x0

    move/from16 v11, p14

    :goto_222
    if-eqz p30, :cond_33c

    move-object/from16 v13, p15

    :goto_226
    const/16 v18, 0x0

    move-object/from16 v10, p22

    move-object/from16 v14, p28

    move-object/from16 v15, p29

    move/from16 v16, p31

    move-object/from16 v17, p32

    move-object/from16 v19, p33

    invoke-static/range {v9 .. v19}, Lcom/android/server/enterprise/SettingsUtils;->insertHostAuthTableRow(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/app/enterprise/Account;ZLandroid/content/Context;)J

    move-result-wide v20

    .line 468
    :goto_238
    const-wide/16 p14, -0x1

    cmp-long p14, p14, p16

    if-eqz p14, :cond_40e

    const-wide/16 p14, -0x1

    cmp-long p14, p14, v20

    if-eqz p14, :cond_40e

    .line 469
    if-eqz p30, :cond_40a

    .line 470
    if-eqz p31, :cond_340

    .line 472
    const-string v15, "0"

    .line 477
    .end local v23           #syncKey:Ljava/lang/String;
    .restart local v15       #syncKey:Ljava/lang/String;
    :goto_24a
    const/16 v26, 0x0

    .line 478
    .local v26, ringtoneUri:Ljava/lang/String;
    if-eqz p31, :cond_347

    .line 480
    const-string v26, "content://settings/system/notification_sound"

    .line 481
    const/16 v22, 0x1

    .line 482
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p14

    invoke-virtual/range {p14 .. p14}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v24

    .line 489
    :goto_25a
    const/16 p14, 0x1

    move/from16 v0, p14

    move/from16 v1, p10

    if-ne v0, v1, :cond_35b

    .line 490
    or-int/lit8 v22, v22, 0x2

    .line 494
    .end local p10
    :cond_264
    :goto_264
    const/16 p10, 0x1

    move/from16 v0, p10

    move/from16 v1, p11

    if-ne v0, v1, :cond_369

    .line 495
    or-int/lit8 v22, v22, 0x40

    .end local p11
    :cond_26e
    :goto_26e
    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move/from16 v16, p4

    move/from16 v17, p5

    move-wide/from16 v18, p16

    move/from16 v23, p6

    move-object/from16 v25, p7

    move-object/from16 v27, p8

    move-object/from16 v31, p9

    move/from16 v32, p30

    move/from16 v33, p31

    move-object/from16 v34, p32

    move-object/from16 v35, p33

    .line 499
    invoke-static/range {v13 .. v35}, Lcom/android/server/enterprise/SettingsUtils;->insertAccountTableRow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJIBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;ZZLandroid/app/enterprise/Account;Landroid/content/Context;)J
    :try_end_28b
    .catchall {:try_start_fe .. :try_end_28b} :catchall_406

    move-result-wide p4

    .line 501
    .end local v36           #accountId:J
    .end local p5
    .local p4, accountId:J
    const-wide/16 p10, -0x1

    cmp-long p0, p10, p4

    if-eqz p0, :cond_2a1

    .line 502
    .end local p0           #displayName:Ljava/lang/String;
    const/16 p0, 0x1

    move/from16 v0, p0

    move/from16 v1, p6

    if-ne v0, v1, :cond_2a1

    .line 503
    :try_start_29a
    move-wide/from16 v0, p4

    move-object/from16 v2, p33

    invoke-static {v0, v1, v2}, Lcom/android/server/enterprise/SettingsUtils;->setAsDefaultAccount(JLandroid/content/Context;)Z

    :cond_2a1
    move-wide/from16 p10, p16

    .line 507
    .end local v26           #ringtoneUri:Ljava/lang/String;
    .end local p15           #easLogin:Ljava/lang/String;
    .end local p16           #inComingRowId:J
    .local p10, inComingRowId:J
    :goto_2a3
    const-wide/16 p14, -0x1

    cmp-long p0, p14, p4

    if-nez p0, :cond_37b

    .line 508
    const-string p0, "SettingsUtils"

    new-instance p6, Ljava/lang/StringBuilder;

    .end local p6
    invoke-direct/range {p6 .. p6}, Ljava/lang/StringBuilder;-><init>()V

    const-string p14, "createNewAccount : Account "

    move-object/from16 v0, p6

    move-object/from16 v1, p14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    if-eqz p31, :cond_377

    const-string p14, "creation"

    :goto_2be
    move-object/from16 v0, p6

    move-object/from16 v1, p14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    const-string p14, " was unsuccessful for EmailId: "

    move-object/from16 v0, p6

    move-object/from16 v1, p14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    move-object/from16 v0, p6

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p6

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    if-eqz p31, :cond_317

    .line 512
    const-string p0, "SettingsUtils"

    const-string p6, "createNewAccount : Starting redundant data cleanup... if any...!!!"

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    const-wide/16 p14, -0x1

    cmp-long p0, p14, v38

    if-eqz p0, :cond_2fd

    .line 514
    move-wide/from16 v0, v38

    move-object/from16 v2, p33

    invoke-static {v0, v1, v2}, Lcom/android/server/enterprise/SettingsUtils;->deleteAccountsTableRow(JLandroid/content/Context;)Z

    .line 517
    :cond_2fd
    const-wide/16 p14, -0x1

    cmp-long p0, p14, p10

    if-eqz p0, :cond_30a

    .line 518
    move-wide/from16 v0, p10

    move-object/from16 v2, p33

    invoke-static {v0, v1, v2}, Lcom/android/server/enterprise/SettingsUtils;->deleteHostAuthTableRow(JLandroid/content/Context;)Z

    .line 521
    :cond_30a
    const-wide/16 p10, -0x1

    cmp-long p0, p10, v20

    if-eqz p0, :cond_317

    .line 522
    .end local p10           #inComingRowId:J
    move-wide/from16 v0, v20

    move-object/from16 v2, p33

    invoke-static {v0, v1, v2}, Lcom/android/server/enterprise/SettingsUtils;->deleteHostAuthTableRow(JLandroid/content/Context;)Z
    :try_end_317
    .catchall {:try_start_29a .. :try_end_317} :catchall_3fd

    :cond_317
    :goto_317
    move-wide/from16 p0, p4

    .end local p1
    .end local p4           #accountId:J
    .local p0, accountId:J
    move-wide/from16 p2, p4

    .line 533
    .end local p0           #accountId:J
    .end local p3
    .local p2, accountId:J
    goto/16 :goto_fc

    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .end local v38           #accountsRowId:J
    .restart local v5       #accountsRowId:J
    .restart local v11       #inComingRowId:J
    .restart local v13       #inComingServerAuthFlags:I
    .restart local v16       #outGoingServerAuthFlags:I
    .restart local v23       #syncKey:Ljava/lang/String;
    .restart local v36       #accountId:J
    .local p0, displayName:Ljava/lang/String;
    .restart local p1
    .local p2, easUser:Ljava/lang/String;
    .restart local p3
    .local p4, syncLookback:I
    .restart local p5
    .restart local p6
    .local p10, emailNotificationVibrateAlways:B
    .restart local p11
    .restart local p14
    .local p15, inComingServerUseSSL:B
    .local p16, inComingServerUseTLS:B
    .restart local p17
    :cond_31d
    move-object/from16 v7, p28

    .line 451
    goto/16 :goto_196

    .end local v5           #accountsRowId:J
    .restart local v38       #accountsRowId:J
    :cond_321
    move v5, v13

    .line 456
    goto/16 :goto_1b1

    .end local v13           #inComingServerAuthFlags:I
    .end local p16           #inComingServerUseTLS:B
    .restart local v8       #inComingServerAuthFlags:I
    .local p15, easLogin:Ljava/lang/String;
    :cond_324
    move-object/from16 v5, p12

    .line 459
    goto/16 :goto_1e3

    :cond_328
    move/from16 v7, p14

    goto/16 :goto_1e9

    .end local p14
    :cond_32c
    move-object/from16 v9, p18

    goto/16 :goto_1ed

    .end local v11           #inComingRowId:J
    .end local p17
    .local p16, inComingRowId:J
    :cond_330
    move/from16 p14, v16

    .line 463
    goto/16 :goto_208

    .end local v16           #outGoingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    :cond_334
    move-object/from16 v9, p21

    .line 465
    goto/16 :goto_21c

    :cond_338
    move/from16 v11, p23

    goto/16 :goto_222

    :cond_33c
    move-object/from16 v13, p27

    goto/16 :goto_226

    .line 474
    :cond_340
    :try_start_340
    move-object/from16 v0, p32

    iget-object v0, v0, Landroid/app/enterprise/Account;->mSyncKey:Ljava/lang/String;

    move-object v15, v0

    .end local v23           #syncKey:Ljava/lang/String;
    .restart local v15       #syncKey:Ljava/lang/String;
    goto/16 :goto_24a

    .line 485
    .restart local v26       #ringtoneUri:Ljava/lang/String;
    :cond_347
    move-object/from16 v0, p32

    iget-object v0, v0, Landroid/app/enterprise/Account;->mRingtoneUri:Ljava/lang/String;

    move-object/from16 v26, v0

    .line 486
    move-object/from16 v0, p32

    iget v0, v0, Landroid/app/enterprise/Account;->mFlags:I

    move/from16 v22, v0

    .line 487
    move-object/from16 v0, p32

    iget-object v0, v0, Landroid/app/enterprise/Account;->mCompatibilityUuid:Ljava/lang/String;

    move-object/from16 v24, v0
    :try_end_359
    .catchall {:try_start_340 .. :try_end_359} :catchall_406

    goto/16 :goto_25a

    .line 491
    :cond_35b
    const/16 p10, 0x2

    and-int/lit8 p14, v22, 0x2

    move/from16 v0, p10

    move/from16 v1, p14

    if-ne v0, v1, :cond_264

    .line 492
    .end local p10           #emailNotificationVibrateAlways:B
    xor-int/lit8 v22, v22, 0x2

    goto/16 :goto_264

    .line 496
    :cond_369
    const/16 p10, 0x40

    and-int/lit8 p11, v22, 0x40

    move/from16 v0, p10

    move/from16 v1, p11

    if-ne v0, v1, :cond_26e

    .line 497
    .end local p11
    xor-int/lit8 v22, v22, 0x40

    goto/16 :goto_26e

    .line 508
    .end local v26           #ringtoneUri:Ljava/lang/String;
    .end local v36           #accountId:J
    .end local p0           #displayName:Ljava/lang/String;
    .end local p5
    .end local p6
    .end local p15           #easLogin:Ljava/lang/String;
    .end local p16           #inComingRowId:J
    .local p4, accountId:J
    .local p10, inComingRowId:J
    :cond_377
    :try_start_377
    const-string p14, "updation"

    goto/16 :goto_2be

    .line 526
    .restart local p6
    :cond_37b
    if-eqz p31, :cond_38f

    .line 527
    new-instance p0, Landroid/content/Intent;

    const-string p6, "com.android.email.ENABLE_MESSAGECOMPOSE"

    .end local p6
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 528
    .local p0, intent:Landroid/content/Intent;
    move-object/from16 v0, p33

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 530
    .end local p0           #intent:Landroid/content/Intent;
    :cond_38f
    const-string p0, "SettingsUtils"

    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct/range {p6 .. p6}, Ljava/lang/StringBuilder;-><init>()V

    const-string p10, "createNewAccount : Account "

    .end local p10           #inComingRowId:J
    move-object/from16 v0, p6

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    if-eqz p31, :cond_400

    const-string p10, "created"

    :goto_3a4
    move-object/from16 v0, p6

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    const-string p10, " successfully for EmailId: "

    move-object/from16 v0, p6

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    move-object/from16 v0, p6

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    const-string p10, " ( "

    move-object/from16 v0, p6

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    if-eqz p31, :cond_403

    const-string p10, "Generated"

    :goto_3cc
    move-object/from16 v0, p6

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    const-string p10, "  AccountId : "

    move-object/from16 v0, p6

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    move-object/from16 v0, p6

    move-wide/from16 v1, p4

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p6

    const-string p10, " )"

    move-object/from16 v0, p6

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p6

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3fb
    .catchall {:try_start_377 .. :try_end_3fb} :catchall_3fd

    goto/16 :goto_317

    .line 387
    :catchall_3fd
    move-exception p0

    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .end local v20           #outGoingRowId:J
    .end local v22           #settingsFlags:I
    .end local v24           #compatibilityUuid:Ljava/lang/String;
    .end local v28           #newMessageCount:I
    .end local v29           #securityFlags:I
    .end local v30           #securitySyncKey:Ljava/lang/String;
    .end local v38           #accountsRowId:J
    :goto_3fe
    monitor-exit v40

    throw p0

    .line 530
    .restart local v8       #inComingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    .restart local v15       #syncKey:Ljava/lang/String;
    .restart local v20       #outGoingRowId:J
    .restart local v22       #settingsFlags:I
    .restart local v24       #compatibilityUuid:Ljava/lang/String;
    .restart local v28       #newMessageCount:I
    .restart local v29       #securityFlags:I
    .restart local v30       #securitySyncKey:Ljava/lang/String;
    .restart local v38       #accountsRowId:J
    :cond_400
    :try_start_400
    const-string p10, "updated"

    goto :goto_3a4

    :cond_403
    const-string p10, "Updated"
    :try_end_405
    .catchall {:try_start_400 .. :try_end_405} :catchall_3fd

    goto :goto_3cc

    .line 387
    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .end local v20           #outGoingRowId:J
    .end local v22           #settingsFlags:I
    .end local v24           #compatibilityUuid:Ljava/lang/String;
    .end local v28           #newMessageCount:I
    .end local v29           #securityFlags:I
    .end local v30           #securitySyncKey:Ljava/lang/String;
    .end local v38           #accountsRowId:J
    .end local p4           #accountId:J
    .restart local v36       #accountId:J
    .restart local p5
    .restart local p6
    :catchall_406
    move-exception p0

    move-wide/from16 p4, v36

    .end local v36           #accountId:J
    .end local p5
    .restart local p4       #accountId:J
    goto :goto_3fe

    .restart local v8       #inComingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    .restart local v20       #outGoingRowId:J
    .restart local v22       #settingsFlags:I
    .restart local v23       #syncKey:Ljava/lang/String;
    .restart local v24       #compatibilityUuid:Ljava/lang/String;
    .restart local v28       #newMessageCount:I
    .restart local v29       #securityFlags:I
    .restart local v30       #securitySyncKey:Ljava/lang/String;
    .restart local v36       #accountId:J
    .restart local v38       #accountsRowId:J
    .local p0, displayName:Ljava/lang/String;
    .local p4, syncLookback:I
    .restart local p5
    .local p10, emailNotificationVibrateAlways:B
    .restart local p11
    .restart local p15       #easLogin:Ljava/lang/String;
    .restart local p16       #inComingRowId:J
    :cond_40a
    move-object/from16 v15, v23

    .end local v23           #syncKey:Ljava/lang/String;
    .restart local v15       #syncKey:Ljava/lang/String;
    goto/16 :goto_24a

    .end local v15           #syncKey:Ljava/lang/String;
    .restart local v23       #syncKey:Ljava/lang/String;
    :cond_40e
    move-wide/from16 p10, p16

    .end local p11
    .end local p16           #inComingRowId:J
    .local p10, inComingRowId:J
    move-object/from16 v15, v23

    .end local v23           #syncKey:Ljava/lang/String;
    .restart local v15       #syncKey:Ljava/lang/String;
    move-wide/from16 p4, v36

    .end local v36           #accountId:J
    .end local p5
    .local p4, accountId:J
    goto/16 :goto_2a3

    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .restart local v16       #outGoingServerAuthFlags:I
    .restart local v23       #syncKey:Ljava/lang/String;
    .restart local v36       #accountId:J
    .local p4, syncLookback:I
    .restart local p5
    .local p10, emailNotificationVibrateAlways:B
    .restart local p11
    .restart local p16       #inComingRowId:J
    :cond_416
    move/from16 v12, v16

    .end local v16           #outGoingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    goto/16 :goto_238

    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .restart local v11       #inComingRowId:J
    .restart local v13       #inComingServerAuthFlags:I
    .restart local v16       #outGoingServerAuthFlags:I
    .restart local p14
    .local p15, inComingServerUseSSL:B
    .local p16, inComingServerUseTLS:B
    .restart local p17
    :cond_41a
    move-wide/from16 p10, v11

    .end local v11           #inComingRowId:J
    .end local p11
    .local p10, inComingRowId:J
    move-object/from16 v15, v23

    .end local v23           #syncKey:Ljava/lang/String;
    .restart local v15       #syncKey:Ljava/lang/String;
    move v8, v13

    .end local v13           #inComingServerAuthFlags:I
    .restart local v8       #inComingServerAuthFlags:I
    move-wide/from16 p4, v36

    .end local v36           #accountId:J
    .end local p5
    .local p4, accountId:J
    move/from16 v12, v16

    .end local v16           #outGoingServerAuthFlags:I
    .restart local v12       #outGoingServerAuthFlags:I
    goto/16 :goto_2a3

    .end local v8           #inComingServerAuthFlags:I
    .end local v12           #outGoingServerAuthFlags:I
    .end local v15           #syncKey:Ljava/lang/String;
    .end local v38           #accountsRowId:J
    .restart local v5       #accountsRowId:J
    .restart local v11       #inComingRowId:J
    .restart local v13       #inComingServerAuthFlags:I
    .restart local v16       #outGoingServerAuthFlags:I
    .restart local v23       #syncKey:Ljava/lang/String;
    .restart local v36       #accountId:J
    .local p4, syncLookback:I
    .restart local p5
    .local p10, emailNotificationVibrateAlways:B
    .restart local p11
    :cond_425
    move-wide/from16 v38, v5

    .end local v5           #accountsRowId:J
    .restart local v38       #accountsRowId:J
    goto/16 :goto_1a4
.end method

.method static declared-synchronized deleteAccount(JLandroid/content/Context;)Z
    .registers 14
    .parameter "accountId"
    .parameter "mContext"

    .prologue
    .line 841
    const-class v9, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v9

    const/4 v2, 0x0

    .line 842
    .local v2, rowCount:I
    const-wide/16 v0, 0x1

    cmp-long v0, v0, p0

    if-lez v0, :cond_16

    .line 843
    :try_start_a
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p1, "deleteAccount : accountId is invalid"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_11
    .catchall {:try_start_a .. :try_end_11} :catchall_bb

    .line 844
    const/4 p0, 0x0

    move p1, p0

    move p0, v2

    .line 899
    .end local v2           #rowCount:I
    .end local p2
    .local p0, rowCount:I
    :goto_14
    monitor-exit v9

    return p1

    .line 846
    .restart local v2       #rowCount:I
    .local p0, accountId:J
    .restart local p2
    :cond_16
    const/4 v0, 0x0

    .line 847
    .local v0, ac:Landroid/app/enterprise/Account;
    const/4 v1, 0x0

    .line 848
    .local v1, found:Z
    const/4 v4, 0x0

    .line 850
    .local v4, isEas:Z
    :try_start_19
    invoke-static {p0, p1, p2}, Lcom/android/server/enterprise/SettingsUtils;->getAccountDetails(JLandroid/content/Context;)Landroid/app/enterprise/Account;
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_bb
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1c} :catch_af

    move-result-object v0

    .line 851
    if-eqz v0, :cond_d9

    move v3, v1

    .end local v1           #found:Z
    .local v3, found:Z
    move-object v6, v0

    .end local v0           #ac:Landroid/app/enterprise/Account;
    .local v6, ac:Landroid/app/enterprise/Account;
    move v5, v2

    .line 854
    .end local v2           #rowCount:I
    .local v5, rowCount:I
    :goto_22
    const/4 v0, 0x0

    .line 855
    .local v0, accountType:Ljava/lang/String;
    :try_start_23
    iget-object v1, v6, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v1, v1, Landroid/app/enterprise/HostAuth;->mProtocol:Ljava/lang/String;

    const-string v2, "eas"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_83

    .line 856
    const-string v0, "com.android.exchange"

    .line 857
    const/4 v4, 0x1

    .line 863
    :goto_32
    iget-object v1, v6, Landroid/app/enterprise/Account;->mEmailAddress:Ljava/lang/String;

    invoke-static {v1, v0, p2}, Lcom/android/server/enterprise/SettingsUtils;->getAccountsDBRowId(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)J

    move-result-wide v1

    .line 864
    .local v1, accountsRowId:J
    const-wide/16 v7, -0x1

    cmp-long v7, v7, v1

    if-eqz v7, :cond_41

    .line 865
    invoke-static {v1, v2, p2}, Lcom/android/server/enterprise/SettingsUtils;->deleteAccountsTableRow(JLandroid/content/Context;)Z

    .line 868
    :cond_41
    iget-wide v1, v6, Landroid/app/enterprise/Account;->mHostAuthKeyRecv:J

    .end local v1           #accountsRowId:J
    invoke-static {v1, v2, p2}, Lcom/android/server/enterprise/SettingsUtils;->deleteHostAuthTableRow(JLandroid/content/Context;)Z

    .line 870
    iget-wide v1, v6, Landroid/app/enterprise/Account;->mHostAuthKeySend:J

    invoke-static {v1, v2, p2}, Lcom/android/server/enterprise/SettingsUtils;->deleteHostAuthTableRow(JLandroid/content/Context;)Z

    .line 873
    iget v1, v6, Landroid/app/enterprise/Account;->mId:I

    int-to-long v1, v1

    invoke-static {v1, v2, p2}, Lcom/android/server/enterprise/SettingsUtils;->deleteAccountTableRow(JLandroid/content/Context;)Z
    :try_end_51
    .catchall {:try_start_23 .. :try_end_51} :catchall_cc
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_51} :catch_85

    move-result v0

    .end local v3           #found:Z
    .local v0, found:Z
    move v7, v0

    .line 878
    .end local v0           #found:Z
    .local v7, found:Z
    :goto_53
    add-int/lit8 v8, v5, 0x1

    .line 880
    .end local v5           #rowCount:I
    .local v8, rowCount:I
    if-eqz v7, :cond_a8

    .line 881
    if-eqz v4, :cond_8b

    .line 882
    :try_start_59
    iget-object v0, v6, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v0, v0, Landroid/app/enterprise/HostAuth;->mLogin:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/server/enterprise/SettingsUtils;->getEasDomainAndUserFromLogin(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 883
    .local v1, ret:[Ljava/lang/String;
    const/4 v0, 0x0

    aget-object v0, v1, v0

    const/4 v2, 0x1

    aget-object v1, v1, v2

    .end local v1           #ret:[Ljava/lang/String;
    iget-object v2, v6, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mAddress:Ljava/lang/String;

    iget-object v3, v6, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v3, v3, Landroid/app/enterprise/HostAuth;->mProtocol:Ljava/lang/String;

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/android/server/enterprise/SettingsUtils;->getAccountId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Context;)J
    :try_end_73
    .catchall {:try_start_59 .. :try_end_73} :catchall_d0
    .catch Ljava/lang/Exception; {:try_start_59 .. :try_end_73} :catch_c6

    move-result-wide p0

    .line 887
    :goto_74
    const-wide/16 v0, -0x1

    cmp-long v0, v0, p0

    if-nez v0, :cond_9e

    move v0, v7

    .end local v7           #found:Z
    .restart local v0       #found:Z
    move-object p2, v6

    .end local v6           #ac:Landroid/app/enterprise/Account;
    .local p2, ac:Landroid/app/enterprise/Account;
    move v1, v8

    .line 899
    .end local v8           #rowCount:I
    .local v1, rowCount:I
    :goto_7d
    if-lez v1, :cond_b9

    const/4 p0, 0x1

    .end local p0           #accountId:J
    :goto_80
    move p1, p0

    move p0, v1

    .end local v1           #rowCount:I
    .local p0, rowCount:I
    goto :goto_14

    .line 859
    .local v0, accountType:Ljava/lang/String;
    .restart local v3       #found:Z
    .restart local v5       #rowCount:I
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    .local p0, accountId:J
    .local p2, mContext:Landroid/content/Context;
    :cond_83
    const/4 v4, 0x0

    goto :goto_32

    .line 875
    :catch_85
    move-exception v1

    .line 876
    .local v1, e:Ljava/lang/Exception;
    :try_start_86
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_89
    .catchall {:try_start_86 .. :try_end_89} :catchall_cc
    .catch Ljava/lang/Exception; {:try_start_86 .. :try_end_89} :catch_c0

    move v7, v3

    .end local v3           #found:Z
    .restart local v7       #found:Z
    goto :goto_53

    .line 885
    .end local v0           #accountType:Ljava/lang/String;
    .end local v1           #e:Ljava/lang/Exception;
    .end local v5           #rowCount:I
    .restart local v8       #rowCount:I
    :cond_8b
    const/4 v0, 0x0

    :try_start_8c
    iget-object v1, v6, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v1, v1, Landroid/app/enterprise/HostAuth;->mLogin:Ljava/lang/String;

    iget-object v2, v6, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mAddress:Ljava/lang/String;

    iget-object v3, v6, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-object v3, v3, Landroid/app/enterprise/HostAuth;->mProtocol:Ljava/lang/String;

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/android/server/enterprise/SettingsUtils;->getAccountId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Context;)J

    move-result-wide p0

    goto :goto_74

    .line 889
    :cond_9e
    invoke-static {p0, p1, p2}, Lcom/android/server/enterprise/SettingsUtils;->getAccountDetails(JLandroid/content/Context;)Landroid/app/enterprise/Account;
    :try_end_a1
    .catchall {:try_start_8c .. :try_end_a1} :catchall_d0
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_a1} :catch_c6

    move-result-object v0

    .line 890
    .end local v6           #ac:Landroid/app/enterprise/Account;
    .local v0, ac:Landroid/app/enterprise/Account;
    if-nez v0, :cond_a9

    move-object p2, v0

    .end local v0           #ac:Landroid/app/enterprise/Account;
    .local p2, ac:Landroid/app/enterprise/Account;
    move v1, v8

    .end local v8           #rowCount:I
    .local v1, rowCount:I
    move v0, v7

    .line 891
    .end local v7           #found:Z
    .local v0, found:Z
    goto :goto_7d

    .end local v0           #found:Z
    .end local v1           #rowCount:I
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    .restart local v7       #found:Z
    .restart local v8       #rowCount:I
    .local p2, mContext:Landroid/content/Context;
    :cond_a8
    move-object v0, v6

    .line 894
    .end local v6           #ac:Landroid/app/enterprise/Account;
    .local v0, ac:Landroid/app/enterprise/Account;
    :cond_a9
    if-nez v7, :cond_d4

    move-object p2, v0

    .end local v0           #ac:Landroid/app/enterprise/Account;
    .local p2, ac:Landroid/app/enterprise/Account;
    move v1, v8

    .end local v8           #rowCount:I
    .restart local v1       #rowCount:I
    move v0, v7

    .end local v7           #found:Z
    .local v0, found:Z
    goto :goto_7d

    .line 896
    .local v0, ac:Landroid/app/enterprise/Account;
    .local v1, found:Z
    .restart local v2       #rowCount:I
    .local p2, mContext:Landroid/content/Context;
    :catch_af
    move-exception p2

    move-object v10, p2

    move-object p2, v0

    .end local v0           #ac:Landroid/app/enterprise/Account;
    .local p2, ac:Landroid/app/enterprise/Account;
    move-object v0, v10

    .line 897
    .local v0, e:Ljava/lang/Exception;
    :goto_b3
    :try_start_b3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_b6
    .catchall {:try_start_b3 .. :try_end_b6} :catchall_bb

    move v0, v1

    .end local v1           #found:Z
    .local v0, found:Z
    move v1, v2

    .end local v2           #rowCount:I
    .local v1, rowCount:I
    goto :goto_7d

    .line 899
    :cond_b9
    const/4 p0, 0x0

    goto :goto_80

    .line 841
    .end local v0           #found:Z
    .end local v1           #rowCount:I
    .end local v4           #isEas:Z
    .end local p0           #accountId:J
    .end local p2           #ac:Landroid/app/enterprise/Account;
    .restart local v2       #rowCount:I
    :catchall_bb
    move-exception p0

    move-object p1, p0

    move p0, v2

    .end local v2           #rowCount:I
    .local p0, rowCount:I
    :goto_be
    monitor-exit v9

    throw p1

    .line 896
    .local v0, accountType:Ljava/lang/String;
    .local v1, e:Ljava/lang/Exception;
    .restart local v3       #found:Z
    .restart local v4       #isEas:Z
    .restart local v5       #rowCount:I
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    .local p0, accountId:J
    .local p2, mContext:Landroid/content/Context;
    :catch_c0
    move-exception p2

    move-object v0, p2

    move v1, v3

    .end local v3           #found:Z
    .local v1, found:Z
    move v2, v5

    .end local v5           #rowCount:I
    .restart local v2       #rowCount:I
    move-object p2, v6

    .end local v6           #ac:Landroid/app/enterprise/Account;
    .local p2, ac:Landroid/app/enterprise/Account;
    goto :goto_b3

    .end local v0           #accountType:Ljava/lang/String;
    .end local v1           #found:Z
    .end local v2           #rowCount:I
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    .restart local v7       #found:Z
    .restart local v8       #rowCount:I
    .local p2, mContext:Landroid/content/Context;
    :catch_c6
    move-exception p2

    move-object v0, p2

    move v1, v7

    .end local v7           #found:Z
    .restart local v1       #found:Z
    move v2, v8

    .end local v8           #rowCount:I
    .restart local v2       #rowCount:I
    move-object p2, v6

    .end local v6           #ac:Landroid/app/enterprise/Account;
    .local p2, ac:Landroid/app/enterprise/Account;
    goto :goto_b3

    .line 841
    .end local v1           #found:Z
    .end local v2           #rowCount:I
    .restart local v0       #accountType:Ljava/lang/String;
    .restart local v3       #found:Z
    .restart local v5       #rowCount:I
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    .local p2, mContext:Landroid/content/Context;
    :catchall_cc
    move-exception p0

    move-object p1, p0

    move p0, v5

    .end local v5           #rowCount:I
    .local p0, rowCount:I
    goto :goto_be

    .end local v0           #accountType:Ljava/lang/String;
    .end local v3           #found:Z
    .restart local v7       #found:Z
    .restart local v8       #rowCount:I
    .local p0, accountId:J
    :catchall_d0
    move-exception p0

    move-object p1, p0

    move p0, v8

    .end local v8           #rowCount:I
    .local p0, rowCount:I
    goto :goto_be

    .end local v6           #ac:Landroid/app/enterprise/Account;
    .local v0, ac:Landroid/app/enterprise/Account;
    .restart local v8       #rowCount:I
    .local p0, accountId:J
    :cond_d4
    move v3, v7

    .end local v7           #found:Z
    .restart local v3       #found:Z
    move-object v6, v0

    .end local v0           #ac:Landroid/app/enterprise/Account;
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    move v5, v8

    .end local v8           #rowCount:I
    .restart local v5       #rowCount:I
    goto/16 :goto_22

    .end local v3           #found:Z
    .end local v5           #rowCount:I
    .end local v6           #ac:Landroid/app/enterprise/Account;
    .restart local v0       #ac:Landroid/app/enterprise/Account;
    .restart local v1       #found:Z
    .restart local v2       #rowCount:I
    :cond_d9
    move-object p2, v0

    .end local v0           #ac:Landroid/app/enterprise/Account;
    .local p2, ac:Landroid/app/enterprise/Account;
    move v0, v1

    .end local v1           #found:Z
    .local v0, found:Z
    move v1, v2

    .end local v2           #rowCount:I
    .local v1, rowCount:I
    goto :goto_7d
.end method

.method static declared-synchronized deleteAccountTableRow(JLandroid/content/Context;)Z
    .registers 11
    .parameter "rowId"
    .parameter "mContext"

    .prologue
    const/4 v7, 0x0

    const-string v3, "SettingsUtils"

    .line 931
    const-class v3, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v3

    const/4 v1, -0x1

    .line 932
    .local v1, rowCount:I
    const-wide/16 v4, 0x1

    cmp-long v4, v4, p0

    if-lez v4, :cond_17

    .line 933
    :try_start_d
    const-string v4, "SettingsUtils"

    const-string v5, "deleteAccountTableRow : rowId is invalid"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_14
    .catchall {:try_start_d .. :try_end_14} :catchall_49

    move v4, v7

    .line 943
    :goto_15
    monitor-exit v3

    return v4

    .line 937
    :cond_17
    :try_start_17
    sget-object v4, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4, p0, p1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 938
    .local v2, uri:Landroid/net/Uri;
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v2, v5, v6}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 939
    const-string v4, "SettingsUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "deleteAccountTableRow : deleted rowCount from Account : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3f
    .catchall {:try_start_17 .. :try_end_3f} :catchall_49
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_3f} :catch_43

    .line 943
    .end local v2           #uri:Landroid/net/Uri;
    :goto_3f
    if-lez v1, :cond_4c

    const/4 v4, 0x1

    goto :goto_15

    .line 940
    :catch_43
    move-exception v4

    move-object v0, v4

    .line 941
    .local v0, e:Ljava/lang/Exception;
    :try_start_45
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_49

    goto :goto_3f

    .line 931
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_49
    move-exception v4

    monitor-exit v3

    throw v4

    :cond_4c
    move v4, v7

    .line 943
    goto :goto_15
.end method

.method private static declared-synchronized deleteAccountsTableRow(JLandroid/content/Context;)Z
    .registers 14
    .parameter "rowId"
    .parameter "mContext"

    .prologue
    const-wide/16 v9, -0x1

    const/4 v8, 0x0

    const-string v4, "SettingsUtils"

    .line 618
    const-class v4, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v4

    const/4 v0, 0x0

    .line 619
    .local v0, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    const-wide/16 v5, 0x1

    cmp-long v5, v5, p0

    if-lez v5, :cond_19

    .line 620
    :try_start_f
    const-string v5, "SettingsUtils"

    const-string v6, "deleteAccountsTableRow : rowId is invalid"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_16
    .catchall {:try_start_f .. :try_end_16} :catchall_6f

    move v5, v8

    .line 639
    :goto_17
    monitor-exit v4

    return v5

    .line 624
    :cond_19
    :try_start_19
    const-string v1, "/data/system/accounts.db"

    .line 625
    .local v1, accountsDBPath:Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 627
    const-string v5, "accounts"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "_id = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    .line 628
    .local v3, rowCount:I
    if-lez v3, :cond_60

    .line 629
    :goto_3d
    const-string v5, "SettingsUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "deleteAccountsTableRow - deleted row Id : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_55
    .catchall {:try_start_19 .. :try_end_55} :catchall_72
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_55} :catch_62

    .line 635
    if-eqz v0, :cond_5a

    .line 636
    :try_start_57
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_5a
    .catchall {:try_start_57 .. :try_end_5a} :catchall_6f

    .line 639
    .end local v1           #accountsDBPath:Ljava/lang/String;
    .end local v3           #rowCount:I
    :cond_5a
    :goto_5a
    cmp-long v5, v9, p0

    if-eqz v5, :cond_79

    const/4 v5, 0x1

    goto :goto_17

    .restart local v1       #accountsDBPath:Ljava/lang/String;
    .restart local v3       #rowCount:I
    :cond_60
    move-wide p0, v9

    .line 628
    goto :goto_3d

    .line 631
    .end local v1           #accountsDBPath:Ljava/lang/String;
    .end local v3           #rowCount:I
    :catch_62
    move-exception v5

    move-object v2, v5

    .line 632
    .local v2, e:Ljava/lang/Exception;
    const-wide/16 p0, -0x1

    .line 633
    :try_start_66
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_69
    .catchall {:try_start_66 .. :try_end_69} :catchall_72

    .line 635
    if-eqz v0, :cond_5a

    .line 636
    :try_start_6b
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_6e
    .catchall {:try_start_6b .. :try_end_6e} :catchall_6f

    goto :goto_5a

    .line 618
    .end local v2           #e:Ljava/lang/Exception;
    :catchall_6f
    move-exception v5

    monitor-exit v4

    throw v5

    .line 635
    :catchall_72
    move-exception v5

    if-eqz v0, :cond_78

    .line 636
    :try_start_75
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 635
    :cond_78
    throw v5
    :try_end_79
    .catchall {:try_start_75 .. :try_end_79} :catchall_6f

    :cond_79
    move v5, v8

    .line 639
    goto :goto_17
.end method

.method static declared-synchronized deleteHostAuthTableRow(JLandroid/content/Context;)Z
    .registers 11
    .parameter "rowId"
    .parameter "mContext"

    .prologue
    const/4 v7, 0x0

    const-string v3, "SettingsUtils"

    .line 909
    const-class v3, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v3

    const/4 v1, -0x1

    .line 910
    .local v1, rowCount:I
    const-wide/16 v4, 0x1

    cmp-long v4, v4, p0

    if-lez v4, :cond_17

    .line 911
    :try_start_d
    const-string v4, "SettingsUtils"

    const-string v5, "deleteHostAuthTableRow : rowId is invalid"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_14
    .catchall {:try_start_d .. :try_end_14} :catchall_49

    move v4, v7

    .line 921
    :goto_15
    monitor-exit v3

    return v4

    .line 915
    :cond_17
    :try_start_17
    sget-object v4, Lcom/android/server/enterprise/SettingsUtils;->HOST_AUTH_CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4, p0, p1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 916
    .local v2, uri:Landroid/net/Uri;
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v2, v5, v6}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 917
    const-string v4, "SettingsUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "deleteHostAuthTableRow : deleted rowCount from HostAuth : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3f
    .catchall {:try_start_17 .. :try_end_3f} :catchall_49
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_3f} :catch_43

    .line 921
    .end local v2           #uri:Landroid/net/Uri;
    :goto_3f
    if-lez v1, :cond_4c

    const/4 v4, 0x1

    goto :goto_15

    .line 918
    :catch_43
    move-exception v4

    move-object v0, v4

    .line 919
    .local v0, e:Ljava/lang/Exception;
    :try_start_45
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_49

    goto :goto_3f

    .line 909
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_49
    move-exception v4

    monitor-exit v3

    throw v4

    :cond_4c
    move v4, v7

    .line 921
    goto :goto_15
.end method

.method public static declared-synchronized fillExistingAccountInfo(Landroid/app/enterprise/Account;Lcom/android/server/enterprise/AccountMetaData;)V
    .registers 7
    .parameter "ac"
    .parameter "amd"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 296
    const-class v1, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v1

    :try_start_5
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mLogin:Ljava/lang/String;

    invoke-static {v2}, Lcom/android/server/enterprise/SettingsUtils;->getEasDomainAndUserFromLogin(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 297
    .local v0, easDomainAndUser:[Ljava/lang/String;
    iget-object v2, p0, Landroid/app/enterprise/Account;->mDisplayName:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mDisplayName:Ljava/lang/String;

    .line 298
    iget-object v2, p0, Landroid/app/enterprise/Account;->mEmailAddress:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mEmailAddress:Ljava/lang/String;

    .line 299
    const/4 v2, 0x1

    aget-object v2, v0, v2

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mEasUser:Ljava/lang/String;

    .line 300
    const/4 v2, 0x0

    aget-object v2, v0, v2

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mEasDomain:Ljava/lang/String;

    .line 301
    iget v2, p0, Landroid/app/enterprise/Account;->mSyncLookback:I

    iput v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mSyncLookback:I

    .line 302
    iget v2, p0, Landroid/app/enterprise/Account;->mSyncInterval:I

    iput v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mSyncInterval:I

    .line 303
    iget-boolean v2, p0, Landroid/app/enterprise/Account;->mIsDefault:Z

    if-eqz v2, :cond_d1

    move v2, v4

    :goto_2c
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mIsDefault:B

    .line 304
    iget-object v2, p0, Landroid/app/enterprise/Account;->mSenderName:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mSenderName:Ljava/lang/String;

    .line 305
    iget-object v2, p0, Landroid/app/enterprise/Account;->mProtocolVersion:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mProtocolVersion:Ljava/lang/String;

    .line 306
    iget-object v2, p0, Landroid/app/enterprise/Account;->mSignature:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mSignature:Ljava/lang/String;

    .line 308
    iget-boolean v2, p0, Landroid/app/enterprise/Account;->mEmailNotificationVibrateAlways:Z

    if-eqz v2, :cond_d4

    move v2, v4

    :goto_40
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mEmailNotificationVibrateAlways:B

    .line 309
    iget-boolean v2, p0, Landroid/app/enterprise/Account;->mEmailNotificationVibrateWhenSilent:Z

    if-eqz v2, :cond_d7

    move v2, v4

    :goto_48
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mEmailNotificationVibrateWhenSilent:B

    .line 311
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mProtocol:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingProtocol:Ljava/lang/String;

    .line 312
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mAddress:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerAddress:Ljava/lang/String;

    .line 313
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget v2, v2, Landroid/app/enterprise/HostAuth;->mPort:I

    iput v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPort:I

    .line 314
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-boolean v2, v2, Landroid/app/enterprise/HostAuth;->mUseSSL:Z

    if-eqz v2, :cond_da

    move v2, v4

    :goto_64
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseSSL:B

    .line 315
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-boolean v2, v2, Landroid/app/enterprise/HostAuth;->mUseTLS:Z

    if-eqz v2, :cond_dc

    move v2, v4

    :goto_6e
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseTLS:B

    .line 316
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-boolean v2, v2, Landroid/app/enterprise/HostAuth;->mAcceptAllCertificates:Z

    if-eqz v2, :cond_de

    move v2, v4

    :goto_78
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerAcceptAllCertificates:B

    .line 317
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mLogin:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerLogin:Ljava/lang/String;

    .line 318
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mPassword:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPassword:Ljava/lang/String;

    .line 319
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mDomain:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPathPrefix:Ljava/lang/String;

    .line 321
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mProtocol:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingProtocol:Ljava/lang/String;

    .line 322
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mAddress:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerAddress:Ljava/lang/String;

    .line 323
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget v2, v2, Landroid/app/enterprise/HostAuth;->mPort:I

    iput v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPort:I

    .line 324
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-boolean v2, v2, Landroid/app/enterprise/HostAuth;->mUseSSL:Z

    if-eqz v2, :cond_e0

    move v2, v4

    :goto_a6
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseSSL:B

    .line 325
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-boolean v2, v2, Landroid/app/enterprise/HostAuth;->mUseTLS:Z

    if-eqz v2, :cond_e2

    move v2, v4

    :goto_b0
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseTLS:B

    .line 326
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-boolean v2, v2, Landroid/app/enterprise/HostAuth;->mAcceptAllCertificates:Z

    if-eqz v2, :cond_e4

    move v2, v4

    :goto_ba
    int-to-byte v2, v2

    iput-byte v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerAcceptAllCertificates:B

    .line 327
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mLogin:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerLogin:Ljava/lang/String;

    .line 328
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mPassword:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPassword:Ljava/lang/String;

    .line 329
    iget-object v2, p0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    iget-object v2, v2, Landroid/app/enterprise/HostAuth;->mDomain:Ljava/lang/String;

    iput-object v2, p1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPathPrefix:Ljava/lang/String;
    :try_end_cf
    .catchall {:try_start_5 .. :try_end_cf} :catchall_e6

    .line 330
    monitor-exit v1

    return-void

    :cond_d1
    move v2, v3

    .line 303
    goto/16 :goto_2c

    :cond_d4
    move v2, v3

    .line 308
    goto/16 :goto_40

    :cond_d7
    move v2, v3

    .line 309
    goto/16 :goto_48

    :cond_da
    move v2, v3

    .line 314
    goto :goto_64

    :cond_dc
    move v2, v3

    .line 315
    goto :goto_6e

    :cond_de
    move v2, v3

    .line 316
    goto :goto_78

    :cond_e0
    move v2, v3

    .line 324
    goto :goto_a6

    :cond_e2
    move v2, v3

    .line 325
    goto :goto_b0

    :cond_e4
    move v2, v3

    .line 326
    goto :goto_ba

    .line 296
    .end local v0           #easDomainAndUser:[Ljava/lang/String;
    :catchall_e6
    move-exception v2

    monitor-exit v1

    throw v2
.end method

.method private static declared-synchronized getAccount(JLandroid/content/Context;)Landroid/app/enterprise/Account;
    .registers 16
    .parameter "accountId"
    .parameter "mContext"

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x0

    const/4 v10, 0x1

    const-string v0, "_id"

    .line 1039
    const-class v9, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v9

    const/4 v6, 0x0

    .line 1040
    .local v6, ac:Landroid/app/enterprise/Account;
    const/4 v8, 0x0

    .line 1042
    .local v8, c:Landroid/database/Cursor;
    const/16 v0, 0x12

    :try_start_c
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "displayName"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "emailAddress"

    aput-object v1, v2, v0

    const/4 v0, 0x3

    const-string v1, "syncKey"

    aput-object v1, v2, v0

    const/4 v0, 0x4

    const-string v1, "syncLookback"

    aput-object v1, v2, v0

    const/4 v0, 0x5

    const-string v1, "syncInterval"

    aput-object v1, v2, v0

    const/4 v0, 0x6

    const-string v1, "hostAuthKeyRecv"

    aput-object v1, v2, v0

    const/4 v0, 0x7

    const-string v1, "hostAuthKeySend"

    aput-object v1, v2, v0

    const/16 v0, 0x8

    const-string v1, "flags"

    aput-object v1, v2, v0

    const/16 v0, 0x9

    const-string v1, "isDefault"

    aput-object v1, v2, v0

    const/16 v0, 0xa

    const-string v1, "compatibilityUuid"

    aput-object v1, v2, v0

    const/16 v0, 0xb

    const-string v1, "senderName"

    aput-object v1, v2, v0

    const/16 v0, 0xc

    const-string v1, "ringtoneUri"

    aput-object v1, v2, v0

    const/16 v0, 0xd

    const-string v1, "protocolVersion"

    aput-object v1, v2, v0

    const/16 v0, 0xe

    const-string v1, "newMessageCount"

    aput-object v1, v2, v0

    const/16 v0, 0xf

    const-string v1, "securityFlags"

    aput-object v1, v2, v0

    const/16 v0, 0x10

    const-string v1, "securitySyncKey"

    aput-object v1, v2, v0

    const/16 v0, 0x11

    const-string v1, "signature"

    aput-object v1, v2, v0
    :try_end_72
    .catchall {:try_start_c .. :try_end_72} :catchall_1c0

    .line 1048
    .local v2, ID_PROJECTION:[Ljava/lang/String;
    :try_start_72
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1049
    const-string v0, "SettingsUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAccount row count : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1050
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_1ab

    .line 1051
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1052
    new-instance v7, Landroid/app/enterprise/Account;

    invoke-direct {v7}, Landroid/app/enterprise/Account;-><init>()V
    :try_end_bb
    .catchall {:try_start_72 .. :try_end_bb} :catchall_1b9

    .line 1053
    .end local v6           #ac:Landroid/app/enterprise/Account;
    .local v7, ac:Landroid/app/enterprise/Account;
    :try_start_bb
    const-string v0, "_id"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, v7, Landroid/app/enterprise/Account;->mId:I

    .line 1054
    const-string v0, "displayName"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mDisplayName:Ljava/lang/String;

    .line 1055
    const-string v0, "emailAddress"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mEmailAddress:Ljava/lang/String;

    .line 1056
    const-string v0, "syncKey"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mSyncKey:Ljava/lang/String;

    .line 1057
    const-string v0, "syncLookback"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, v7, Landroid/app/enterprise/Account;->mSyncLookback:I

    .line 1058
    const-string v0, "syncInterval"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, v7, Landroid/app/enterprise/Account;->mSyncInterval:I

    .line 1059
    const-string v0, "hostAuthKeyRecv"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, v7, Landroid/app/enterprise/Account;->mHostAuthKeyRecv:J

    .line 1060
    const-string v0, "hostAuthKeySend"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, v7, Landroid/app/enterprise/Account;->mHostAuthKeySend:J

    .line 1061
    const-string v0, "flags"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, v7, Landroid/app/enterprise/Account;->mFlags:I

    .line 1062
    iget v0, v7, Landroid/app/enterprise/Account;->mFlags:I

    and-int/lit8 v0, v0, 0x2

    if-ne v12, v0, :cond_1b2

    move v0, v10

    :goto_12e
    iput-boolean v0, v7, Landroid/app/enterprise/Account;->mEmailNotificationVibrateAlways:Z

    .line 1063
    const/16 v0, 0x40

    iget v1, v7, Landroid/app/enterprise/Account;->mFlags:I

    and-int/lit8 v1, v1, 0x40

    if-ne v0, v1, :cond_1b5

    move v0, v10

    :goto_139
    iput-boolean v0, v7, Landroid/app/enterprise/Account;->mEmailNotificationVibrateWhenSilent:Z

    .line 1064
    const-string v0, "isDefault"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-ne v0, v10, :cond_1b7

    move v0, v10

    :goto_148
    iput-boolean v0, v7, Landroid/app/enterprise/Account;->mIsDefault:Z

    .line 1065
    const-string v0, "compatibilityUuid"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mCompatibilityUuid:Ljava/lang/String;

    .line 1066
    const-string v0, "senderName"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mSenderName:Ljava/lang/String;

    .line 1067
    const-string v0, "ringtoneUri"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mRingtoneUri:Ljava/lang/String;

    .line 1068
    const-string v0, "protocolVersion"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mProtocolVersion:Ljava/lang/String;

    .line 1069
    const-string v0, "newMessageCount"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, v7, Landroid/app/enterprise/Account;->mNewMessageCount:I

    .line 1070
    const-string v0, "securityFlags"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, v7, Landroid/app/enterprise/Account;->mSecurityFlags:I

    .line 1071
    const-string v0, "securitySyncKey"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mSecuritySyncKey:Ljava/lang/String;

    .line 1072
    const-string v0, "signature"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/app/enterprise/Account;->mSignature:Ljava/lang/String;
    :try_end_1aa
    .catchall {:try_start_bb .. :try_end_1aa} :catchall_1c3

    move-object v6, v7

    .line 1075
    .end local v7           #ac:Landroid/app/enterprise/Account;
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    :cond_1ab
    if-eqz v8, :cond_1b0

    .line 1076
    :try_start_1ad
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_1b0
    .catchall {:try_start_1ad .. :try_end_1b0} :catchall_1c0

    .line 1078
    :cond_1b0
    monitor-exit v9

    return-object v6

    .end local v6           #ac:Landroid/app/enterprise/Account;
    .restart local v7       #ac:Landroid/app/enterprise/Account;
    :cond_1b2
    move v0, v11

    .line 1062
    goto/16 :goto_12e

    :cond_1b5
    move v0, v11

    .line 1063
    goto :goto_139

    :cond_1b7
    move v0, v11

    .line 1064
    goto :goto_148

    .line 1075
    .end local v7           #ac:Landroid/app/enterprise/Account;
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    :catchall_1b9
    move-exception v0

    :goto_1ba
    if-eqz v8, :cond_1bf

    .line 1076
    :try_start_1bc
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1075
    :cond_1bf
    throw v0
    :try_end_1c0
    .catchall {:try_start_1bc .. :try_end_1c0} :catchall_1c0

    .line 1039
    .end local v2           #ID_PROJECTION:[Ljava/lang/String;
    :catchall_1c0
    move-exception v0

    monitor-exit v9

    throw v0

    .line 1075
    .end local v6           #ac:Landroid/app/enterprise/Account;
    .restart local v2       #ID_PROJECTION:[Ljava/lang/String;
    .restart local v7       #ac:Landroid/app/enterprise/Account;
    :catchall_1c3
    move-exception v0

    move-object v6, v7

    .end local v7           #ac:Landroid/app/enterprise/Account;
    .restart local v6       #ac:Landroid/app/enterprise/Account;
    goto :goto_1ba
.end method

.method static declared-synchronized getAccountDetails(JLandroid/content/Context;)Landroid/app/enterprise/Account;
    .registers 9
    .parameter "accountId"
    .parameter "mContext"

    .prologue
    .line 1018
    const-class v3, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v3

    const/4 v0, 0x0

    .line 1019
    .local v0, ac:Landroid/app/enterprise/Account;
    :try_start_4
    invoke-static {p0, p1, p2}, Lcom/android/server/enterprise/SettingsUtils;->getAccount(JLandroid/content/Context;)Landroid/app/enterprise/Account;

    move-result-object v0

    .line 1020
    if-eqz v0, :cond_22

    .line 1021
    const/4 v1, 0x0

    .line 1022
    .local v1, haRecv:Landroid/app/enterprise/HostAuth;
    const/4 v2, 0x0

    .line 1023
    .local v2, haSend:Landroid/app/enterprise/HostAuth;
    iget-wide v4, v0, Landroid/app/enterprise/Account;->mHostAuthKeyRecv:J

    invoke-static {v4, v5, p2}, Lcom/android/server/enterprise/SettingsUtils;->getHostAuth(JLandroid/content/Context;)Landroid/app/enterprise/HostAuth;

    move-result-object v1

    .line 1024
    if-eqz v1, :cond_1a

    .line 1025
    iget-wide v4, v0, Landroid/app/enterprise/Account;->mHostAuthKeySend:J

    invoke-static {v4, v5, p2}, Lcom/android/server/enterprise/SettingsUtils;->getHostAuth(JLandroid/content/Context;)Landroid/app/enterprise/HostAuth;

    move-result-object v2

    .line 1027
    :cond_1a
    if-eqz v1, :cond_24

    if-eqz v2, :cond_24

    .line 1028
    iput-object v1, v0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    .line 1029
    iput-object v2, v0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;
    :try_end_22
    .catchall {:try_start_4 .. :try_end_22} :catchall_26

    .line 1035
    .end local v1           #haRecv:Landroid/app/enterprise/HostAuth;
    .end local v2           #haSend:Landroid/app/enterprise/HostAuth;
    :cond_22
    :goto_22
    monitor-exit v3

    return-object v0

    .line 1032
    .restart local v1       #haRecv:Landroid/app/enterprise/HostAuth;
    .restart local v2       #haSend:Landroid/app/enterprise/HostAuth;
    :cond_24
    const/4 v0, 0x0

    goto :goto_22

    .line 1018
    .end local v1           #haRecv:Landroid/app/enterprise/HostAuth;
    .end local v2           #haSend:Landroid/app/enterprise/HostAuth;
    :catchall_26
    move-exception v4

    monitor-exit v3

    throw v4
.end method

.method static declared-synchronized getAccountId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Context;)J
    .registers 20
    .parameter "easDomain"
    .parameter "user"
    .parameter "serverAddress"
    .parameter "protocol"
    .parameter "isEas"
    .parameter "mContext"

    .prologue
    .line 955
    const-class v13, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v13

    const-wide/16 v8, -0x1

    .line 956
    .local v8, accountId:J
    const/4 v10, 0x0

    .line 958
    .local v10, c:Landroid/database/Cursor;
    :try_start_6
    invoke-static {p0}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 959
    invoke-static {p1}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 960
    invoke-static/range {p2 .. p2}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 961
    invoke-static/range {p3 .. p3}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 963
    if-eqz p1, :cond_1c

    if-eqz p2, :cond_1c

    if-nez p3, :cond_2d

    .line 964
    :cond_1c
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p4, "getAccountId : Error :: Invalid input parameters."

    .end local p4
    move-object v0, p0

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_26
    .catchall {:try_start_6 .. :try_end_26} :catchall_149

    move-object p0, v10

    .end local v10           #c:Landroid/database/Cursor;
    .local p0, c:Landroid/database/Cursor;
    move-wide/from16 p2, v8

    .end local v8           #accountId:J
    .end local p3
    .local p2, accountId:J
    move-wide/from16 p4, v8

    .line 1008
    .end local p2           #accountId:J
    .end local p5
    .local p4, accountId:J
    :goto_2b
    monitor-exit v13

    return-wide p4

    .line 967
    .restart local v8       #accountId:J
    .restart local v10       #c:Landroid/database/Cursor;
    .local p0, easDomain:Ljava/lang/String;
    .local p2, serverAddress:Ljava/lang/String;
    .restart local p3
    .local p4, isEas:Z
    .restart local p5
    :cond_2d
    if-eqz p4, :cond_4e

    if-eqz p0, :cond_4e

    .line 968
    :try_start_31
    new-instance p4, Ljava/lang/StringBuilder;

    .end local p4           #isEas:Z
    invoke-direct/range {p4 .. p4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p4

    move-object v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .end local p0           #easDomain:Ljava/lang/String;
    const-string p4, "\\"

    move-object v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 970
    :cond_4e
    const/4 p0, 0x1

    new-array v4, p0, [Ljava/lang/String;

    const/4 p0, 0x0

    const-string p4, "_id"

    aput-object p4, v4, p0

    .line 974
    .local v4, ID_PROJECTION:[Ljava/lang/String;
    const/4 p0, 0x3

    new-array v6, p0, [Ljava/lang/String;

    const/4 p0, 0x0

    aput-object p3, v6, p0

    const/4 p0, 0x1

    aput-object p2, v6, p0

    const/4 p0, 0x2

    aput-object p1, v6, p0
    :try_end_62
    .catchall {:try_start_31 .. :try_end_62} :catchall_149

    .line 977
    .local v6, selectionArgs:[Ljava/lang/String;
    const-wide/16 v11, -0x1

    .line 979
    .local v11, hostAuthId:J
    :try_start_64
    invoke-virtual/range {p5 .. p5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/android/server/enterprise/SettingsUtils;->HOST_AUTH_CONTENT_URI:Landroid/net/Uri;

    const-string v5, "protocol=? AND address=? AND login=? "

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_70
    .catchall {:try_start_64 .. :try_end_70} :catchall_12f

    move-result-object p0

    .line 980
    .end local v10           #c:Landroid/database/Cursor;
    .local p0, c:Landroid/database/Cursor;
    :try_start_71
    const-string p4, "SettingsUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAccountId for HOST_AUTH row count : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p4

    move-object v1, v2

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 981
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p4

    if-eqz p4, :cond_157

    .line 982
    const-string p4, "_id"

    move-object v0, p0

    move-object/from16 v1, p4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p4

    move-object v0, p0

    move/from16 v1, p4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I
    :try_end_a5
    .catchall {:try_start_71 .. :try_end_a5} :catchall_147

    move-result p4

    move/from16 v0, p4

    int-to-long v0, v0

    move-wide v2, v0

    .line 985
    .end local v11           #hostAuthId:J
    .local v2, hostAuthId:J
    :goto_aa
    if-eqz p0, :cond_af

    .line 986
    :try_start_ac
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 988
    :cond_af
    const/4 p0, 0x0

    .line 990
    const-wide/16 v10, -0x1

    cmp-long p4, v10, v2

    if-eqz p4, :cond_154

    .line 991
    const/16 p4, 0x1

    move/from16 v0, p4

    new-array v0, v0, [Ljava/lang/String;

    move-object v4, v0

    .end local v4           #ID_PROJECTION:[Ljava/lang/String;
    const/16 p4, 0x0

    const-string v5, "_id"

    aput-object v5, v4, p4

    .line 994
    .restart local v4       #ID_PROJECTION:[Ljava/lang/String;
    const/16 p4, 0x2

    move/from16 v0, p4

    new-array v0, v0, [Ljava/lang/String;

    move-object v6, v0

    .end local v6           #selectionArgs:[Ljava/lang/String;
    const/16 p4, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, p4

    const/16 p4, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    .end local v2           #hostAuthId:J
    aput-object v2, v6, p4
    :try_end_da
    .catchall {:try_start_ac .. :try_end_da} :catchall_139

    .line 998
    .restart local v6       #selectionArgs:[Ljava/lang/String;
    :try_start_da
    invoke-virtual/range {p5 .. p5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    const-string v5, "hostAuthKeyRecv=? OR hostAuthKeySend=? "

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 999
    const-string p4, "SettingsUtils"

    new-instance p5, Ljava/lang/StringBuilder;

    .end local p5
    invoke-direct/range {p5 .. p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getAccountId for ACCOUNT row count : "

    move-object/from16 v0, p5

    move-object v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    move-object/from16 v0, p5

    move v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual/range {p5 .. p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static/range {p4 .. p5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1000
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p4

    if-eqz p4, :cond_151

    .line 1001
    const-string p4, "_id"

    move-object v0, p0

    move-object/from16 v1, p4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p4

    move-object v0, p0

    move/from16 v1, p4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I
    :try_end_11e
    .catchall {:try_start_da .. :try_end_11e} :catchall_140

    move-result p4

    move/from16 v0, p4

    int-to-long v0, v0

    move-wide/from16 p4, v0

    .line 1004
    .end local v8           #accountId:J
    .local p4, accountId:J
    :goto_124
    if-eqz p0, :cond_129

    .line 1005
    :try_start_126
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_129
    .catchall {:try_start_126 .. :try_end_129} :catchall_14f

    :cond_129
    move-wide/from16 p2, p4

    .end local p3
    .end local p4           #accountId:J
    .local p2, accountId:J
    :goto_12b
    move-wide/from16 p4, p2

    .line 1008
    .end local p2           #accountId:J
    .restart local p4       #accountId:J
    goto/16 :goto_2b

    .line 985
    .end local p0           #c:Landroid/database/Cursor;
    .end local p4           #accountId:J
    .restart local v8       #accountId:J
    .restart local v10       #c:Landroid/database/Cursor;
    .restart local v11       #hostAuthId:J
    .local p2, serverAddress:Ljava/lang/String;
    .restart local p3
    .restart local p5
    :catchall_12f
    move-exception p0

    move-object/from16 p4, p0

    move-object p0, v10

    .end local v10           #c:Landroid/database/Cursor;
    .restart local p0       #c:Landroid/database/Cursor;
    :goto_133
    if-eqz p0, :cond_138

    .line 986
    :try_start_135
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 985
    :cond_138
    throw p4
    :try_end_139
    .catchall {:try_start_135 .. :try_end_139} :catchall_139

    .line 955
    .end local v4           #ID_PROJECTION:[Ljava/lang/String;
    .end local v6           #selectionArgs:[Ljava/lang/String;
    .end local v11           #hostAuthId:J
    .end local p5
    :catchall_139
    move-exception p4

    move-object/from16 v2, p4

    move-wide/from16 p4, v8

    .end local v8           #accountId:J
    .restart local p4       #accountId:J
    :goto_13e
    monitor-exit v13

    throw v2

    .line 1004
    .end local p4           #accountId:J
    .restart local v4       #ID_PROJECTION:[Ljava/lang/String;
    .restart local v6       #selectionArgs:[Ljava/lang/String;
    .restart local v8       #accountId:J
    :catchall_140
    move-exception p4

    if-eqz p0, :cond_146

    .line 1005
    :try_start_143
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 1004
    :cond_146
    throw p4
    :try_end_147
    .catchall {:try_start_143 .. :try_end_147} :catchall_139

    .line 985
    .restart local v11       #hostAuthId:J
    .restart local p5
    :catchall_147
    move-exception p4

    goto :goto_133

    .line 955
    .end local v4           #ID_PROJECTION:[Ljava/lang/String;
    .end local v6           #selectionArgs:[Ljava/lang/String;
    .end local v11           #hostAuthId:J
    .end local p0           #c:Landroid/database/Cursor;
    .restart local v10       #c:Landroid/database/Cursor;
    :catchall_149
    move-exception p0

    move-wide/from16 p4, v8

    .end local v8           #accountId:J
    .end local p5
    .restart local p4       #accountId:J
    move-object v2, p0

    move-object p0, v10

    .end local v10           #c:Landroid/database/Cursor;
    .restart local p0       #c:Landroid/database/Cursor;
    goto :goto_13e

    .restart local v4       #ID_PROJECTION:[Ljava/lang/String;
    .restart local v6       #selectionArgs:[Ljava/lang/String;
    :catchall_14f
    move-exception v2

    goto :goto_13e

    .end local p4           #accountId:J
    .restart local v8       #accountId:J
    :cond_151
    move-wide/from16 p4, v8

    .end local v8           #accountId:J
    .restart local p4       #accountId:J
    goto :goto_124

    .end local p4           #accountId:J
    .restart local v2       #hostAuthId:J
    .restart local v8       #accountId:J
    .restart local p5
    :cond_154
    move-wide/from16 p2, v8

    .end local v8           #accountId:J
    .end local p3
    .local p2, accountId:J
    goto :goto_12b

    .end local v2           #hostAuthId:J
    .restart local v8       #accountId:J
    .restart local v11       #hostAuthId:J
    .local p2, serverAddress:Ljava/lang/String;
    .restart local p3
    :cond_157
    move-wide v2, v11

    .end local v11           #hostAuthId:J
    .restart local v2       #hostAuthId:J
    goto/16 :goto_aa
.end method

.method private static declared-synchronized getAccountsDBRowId(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)J
    .registers 16
    .parameter "emailId"
    .parameter "accountType"
    .parameter "mContext"

    .prologue
    .line 643
    const-class v5, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v5

    const/4 p2, 0x0

    .line 644
    .local p2, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v2, 0x0

    .line 645
    .local v2, cr:Landroid/database/Cursor;
    const-wide/16 v3, -0x1

    .line 646
    .local v3, rowId:J
    :try_start_7
    invoke-static {p0}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 647
    invoke-static {p1}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_15a

    move-result-object p1

    .line 649
    if-eqz p0, :cond_13b

    .line 651
    :try_start_11
    const-string v0, "/data/system/accounts.db"

    .line 652
    .local v0, accountsDBPath:Ljava/lang/String;
    const/4 v1, 0x0

    const/4 v6, 0x0

    invoke-static {v0, v1, v6}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2

    .line 653
    const-wide/16 v0, -0x1

    .line 655
    .local v0, accountsDBRowId:J
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SELECT rowid FROM accounts WHERE name = \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz p1, :cond_d2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\' AND type = \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_3f
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {p2, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 656
    const-string v6, "SettingsUtils"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getAccountsDBRowId - got row count : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " for emailAddress : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz p1, :cond_d6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " AND account type : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_86
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 657
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v6

    if-lez v6, :cond_a5

    .line 658
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 659
    const/4 v0, 0x0

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J

    .end local v0           #accountsDBRowId:J
    move-result-wide v0

    .line 660
    .restart local v0       #accountsDBRowId:J
    if-eqz v2, :cond_a4

    .line 661
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_a4
    .catchall {:try_start_11 .. :try_end_a4} :catchall_127
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_a4} :catch_10f

    .line 662
    :cond_a4
    const/4 v2, 0x0

    .line 664
    :cond_a5
    const-wide/16 v6, -0x1

    cmp-long v6, v6, v0

    if-eqz v6, :cond_d9

    .line 665
    move-wide v0, v0

    .line 666
    .end local v3           #rowId:J
    .local v0, rowId:J
    :try_start_ac
    const-string p0, "SettingsUtils"

    .end local p0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAccountsDBRowId - Found row Id : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c4
    .catchall {:try_start_ac .. :try_end_c4} :catchall_146
    .catch Ljava/lang/Exception; {:try_start_ac .. :try_end_c4} :catch_152

    .line 674
    :goto_c4
    if-eqz v2, :cond_c9

    .line 675
    :try_start_c6
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 676
    :cond_c9
    if-eqz p2, :cond_ce

    .line 677
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_ce
    .catchall {:try_start_c6 .. :try_end_ce} :catchall_166

    :cond_ce
    move-object p1, v2

    .end local v2           #cr:Landroid/database/Cursor;
    .local p1, cr:Landroid/database/Cursor;
    move-object p0, p2

    .line 683
    .end local p2           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .local p0, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :goto_d0
    monitor-exit v5

    return-wide v0

    .line 655
    .local v0, accountsDBRowId:J
    .restart local v2       #cr:Landroid/database/Cursor;
    .restart local v3       #rowId:J
    .local p0, emailId:Ljava/lang/String;
    .local p1, accountType:Ljava/lang/String;
    .restart local p2       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :cond_d2
    :try_start_d2
    const-string v7, ""

    goto/16 :goto_3f

    .line 656
    :cond_d6
    const-string v8, ""

    goto :goto_86

    .line 668
    :cond_d9
    const-string v0, "SettingsUtils"

    .end local v0           #accountsDBRowId:J
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getAccountsDBRowId - entry doesn\'t exist for name: "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .end local p0           #emailId:Ljava/lang/String;
    if-eqz p1, :cond_10c

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " AND account type : "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_ff
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-wide v0, v3

    .end local v3           #rowId:J
    .local v0, rowId:J
    goto :goto_c4

    .end local v0           #rowId:J
    .restart local v3       #rowId:J
    :cond_10c
    const-string v1, ""
    :try_end_10e
    .catchall {:try_start_d2 .. :try_end_10e} :catchall_127
    .catch Ljava/lang/Exception; {:try_start_d2 .. :try_end_10e} :catch_10f

    goto :goto_ff

    .line 670
    :catch_10f
    move-exception p0

    move-object v0, p0

    move-object p0, p2

    .end local p2           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .local p0, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    move-object p2, v2

    .end local v2           #cr:Landroid/database/Cursor;
    .local p2, cr:Landroid/database/Cursor;
    move-wide v1, v3

    .line 671
    .end local v3           #rowId:J
    .local v0, e:Ljava/lang/Exception;
    .local v1, rowId:J
    :goto_114
    const-wide/16 v1, -0x1

    .line 672
    :try_start_116
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_119
    .catchall {:try_start_116 .. :try_end_119} :catchall_14c

    .line 674
    if-eqz p2, :cond_11e

    .line 675
    :try_start_11b
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 676
    :cond_11e
    if-eqz p0, :cond_123

    .line 677
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_123
    .catchall {:try_start_11b .. :try_end_123} :catchall_161

    :cond_123
    move-object p1, p2

    .end local p2           #cr:Landroid/database/Cursor;
    .local p1, cr:Landroid/database/Cursor;
    move-wide v10, v1

    .end local v1           #rowId:J
    .local v10, rowId:J
    move-wide v0, v10

    .line 679
    .end local v10           #rowId:J
    .local v0, rowId:J
    goto :goto_d0

    .line 674
    .end local v0           #rowId:J
    .end local p0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2       #cr:Landroid/database/Cursor;
    .restart local v3       #rowId:J
    .local p1, accountType:Ljava/lang/String;
    .local p2, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_127
    move-exception p0

    move-wide v0, v3

    .end local v3           #rowId:J
    .restart local v0       #rowId:J
    move-object v10, p0

    move-object p0, p2

    .end local p2           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local p0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    move-object p2, v2

    .end local v2           #cr:Landroid/database/Cursor;
    .local p2, cr:Landroid/database/Cursor;
    move-object v2, v10

    :goto_12d
    if-eqz p2, :cond_132

    .line 675
    :try_start_12f
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 676
    :cond_132
    if-eqz p0, :cond_137

    .line 677
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 674
    :cond_137
    throw v2
    :try_end_138
    .catchall {:try_start_12f .. :try_end_138} :catchall_138

    .line 643
    :catchall_138
    move-exception v2

    :goto_139
    monitor-exit v5

    throw v2

    .line 681
    .end local v0           #rowId:J
    .restart local v2       #cr:Landroid/database/Cursor;
    .restart local v3       #rowId:J
    .local p0, emailId:Ljava/lang/String;
    .local p2, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :cond_13b
    :try_start_13b
    const-string p0, "SettingsUtils"

    .end local p0           #emailId:Ljava/lang/String;
    const-string v0, "getAccountsDBRowId : Error :: Invalid input parameters."

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_142
    .catchall {:try_start_13b .. :try_end_142} :catchall_15a

    move-wide v0, v3

    .end local v3           #rowId:J
    .restart local v0       #rowId:J
    move-object p1, v2

    .end local v2           #cr:Landroid/database/Cursor;
    .local p1, cr:Landroid/database/Cursor;
    move-object p0, p2

    .end local p2           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .local p0, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    goto :goto_d0

    .line 674
    .end local p0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2       #cr:Landroid/database/Cursor;
    .local p1, accountType:Ljava/lang/String;
    .restart local p2       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_146
    move-exception p0

    move-object v10, p0

    move-object p0, p2

    .end local p2           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local p0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    move-object p2, v2

    .end local v2           #cr:Landroid/database/Cursor;
    .local p2, cr:Landroid/database/Cursor;
    move-object v2, v10

    goto :goto_12d

    .local v0, e:Ljava/lang/Exception;
    .restart local v1       #rowId:J
    :catchall_14c
    move-exception v0

    move-object v10, v0

    move-wide v11, v1

    .end local v1           #rowId:J
    .local v11, rowId:J
    move-wide v0, v11

    .end local v11           #rowId:J
    .local v0, rowId:J
    move-object v2, v10

    goto :goto_12d

    .line 670
    .end local p0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2       #cr:Landroid/database/Cursor;
    .local p2, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :catch_152
    move-exception p0

    move-object v10, p0

    move-object p0, p2

    .end local p2           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local p0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    move-object p2, v2

    .end local v2           #cr:Landroid/database/Cursor;
    .local p2, cr:Landroid/database/Cursor;
    move-wide v11, v0

    .end local v0           #rowId:J
    .restart local v11       #rowId:J
    move-wide v1, v11

    .end local v11           #rowId:J
    .restart local v1       #rowId:J
    move-object v0, v10

    goto :goto_114

    .line 643
    .end local v1           #rowId:J
    .end local p0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2       #cr:Landroid/database/Cursor;
    .restart local v3       #rowId:J
    .local p2, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_15a
    move-exception p0

    move-wide v0, v3

    .end local v3           #rowId:J
    .restart local v0       #rowId:J
    move-object v10, v2

    .end local v2           #cr:Landroid/database/Cursor;
    .local v10, cr:Landroid/database/Cursor;
    move-object v2, p0

    move-object p0, p2

    .end local p2           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local p0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    move-object p2, v10

    .end local v10           #cr:Landroid/database/Cursor;
    .local p2, cr:Landroid/database/Cursor;
    goto :goto_139

    .local v0, e:Ljava/lang/Exception;
    .restart local v1       #rowId:J
    :catchall_161
    move-exception v0

    move-wide v10, v1

    .end local v1           #rowId:J
    .local v10, rowId:J
    move-object v2, v0

    move-wide v0, v10

    .end local v10           #rowId:J
    .local v0, rowId:J
    goto :goto_139

    .end local p0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2       #cr:Landroid/database/Cursor;
    .local p2, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_166
    move-exception p0

    move-object v10, v2

    .end local v2           #cr:Landroid/database/Cursor;
    .local v10, cr:Landroid/database/Cursor;
    move-object v2, p0

    move-object p0, p2

    .end local p2           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local p0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    move-object p2, v10

    .end local v10           #cr:Landroid/database/Cursor;
    .local p2, cr:Landroid/database/Cursor;
    goto :goto_139
.end method

.method static declared-synchronized getEasDomainAndUserFromLogin(Ljava/lang/String;)[Ljava/lang/String;
    .registers 8
    .parameter "login"

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const-string v2, "\\"

    .line 333
    const-class v2, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v2

    const/4 v3, 0x2

    :try_start_8
    new-array v0, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v0, v3

    const/4 v3, 0x1

    const/4 v4, 0x0

    aput-object v4, v0, v3

    .line 336
    .local v0, easDomainAndUser:[Ljava/lang/String;
    invoke-static {p0}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 337
    if-eqz p0, :cond_46

    .line 338
    const-string v3, "\\"

    invoke-virtual {p0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_46

    .line 339
    const-string v3, "\\"

    invoke-static {v3}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 340
    .local v1, sp:[Ljava/lang/String;
    if-eqz v1, :cond_46

    array-length v3, v1

    if-lez v3, :cond_46

    .line 341
    array-length v3, v1

    if-ne v6, v3, :cond_48

    .line 342
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    .line 343
    const/4 v3, 0x1

    const/4 v4, 0x1

    aget-object v4, v1, v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3
    :try_end_46
    .catchall {:try_start_8 .. :try_end_46} :catchall_56

    .line 350
    .end local v1           #sp:[Ljava/lang/String;
    :cond_46
    :goto_46
    monitor-exit v2

    return-object v0

    .line 344
    .restart local v1       #sp:[Ljava/lang/String;
    :cond_48
    :try_start_48
    array-length v3, v1

    if-ne v5, v3, :cond_46

    .line 345
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3
    :try_end_55
    .catchall {:try_start_48 .. :try_end_55} :catchall_56

    goto :goto_46

    .line 333
    .end local v0           #easDomainAndUser:[Ljava/lang/String;
    .end local v1           #sp:[Ljava/lang/String;
    :catchall_56
    move-exception v3

    monitor-exit v2

    throw v3
.end method

.method private static declared-synchronized getHostAuth(JLandroid/content/Context;)Landroid/app/enterprise/HostAuth;
    .registers 12
    .parameter "id"
    .parameter "mContext"

    .prologue
    .line 1082
    const-class v8, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v8

    const/4 v7, 0x0

    .line 1083
    .local v7, hAuth:Landroid/app/enterprise/HostAuth;
    const/4 v6, 0x0

    .line 1085
    .local v6, c:Landroid/database/Cursor;
    const/16 v0, 0x9

    :try_start_7
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "protocol"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "address"

    aput-object v1, v2, v0

    const/4 v0, 0x3

    const-string v1, "port"

    aput-object v1, v2, v0

    const/4 v0, 0x4

    const-string v1, "flags"

    aput-object v1, v2, v0

    const/4 v0, 0x5

    const-string v1, "login"

    aput-object v1, v2, v0

    const/4 v0, 0x6

    const-string v1, "password"

    aput-object v1, v2, v0

    const/4 v0, 0x7

    const-string v1, "domain"

    aput-object v1, v2, v0

    const/16 v0, 0x8

    const-string v1, "accountKey"

    aput-object v1, v2, v0
    :try_end_37
    .catchall {:try_start_7 .. :try_end_37} :catchall_12c

    .line 1089
    .local v2, ID_PROJECTION:[Ljava/lang/String;
    :try_start_37
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/server/enterprise/SettingsUtils;->HOST_AUTH_CONTENT_URI:Landroid/net/Uri;

    new-instance p2, Ljava/lang/StringBuilder;

    .end local p2
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id = "

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    .end local p0
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_55
    .catchall {:try_start_37 .. :try_end_55} :catchall_119

    move-result-object p0

    .line 1090
    .end local v6           #c:Landroid/database/Cursor;
    .local p0, c:Landroid/database/Cursor;
    :try_start_56
    const-string p1, "SettingsUtils"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getHostAuth row count : "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1091
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result p1

    if-lez p1, :cond_131

    .line 1092
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1093
    new-instance p1, Landroid/app/enterprise/HostAuth;

    invoke-direct {p1}, Landroid/app/enterprise/HostAuth;-><init>()V
    :try_end_80
    .catchall {:try_start_56 .. :try_end_80} :catchall_126

    .line 1094
    .end local v7           #hAuth:Landroid/app/enterprise/HostAuth;
    .local p1, hAuth:Landroid/app/enterprise/HostAuth;
    :try_start_80
    const-string p2, "_id"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    iput p2, p1, Landroid/app/enterprise/HostAuth;->mId:I

    .line 1095
    const-string p2, "protocol"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Landroid/app/enterprise/HostAuth;->mProtocol:Ljava/lang/String;

    .line 1096
    const-string p2, "address"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Landroid/app/enterprise/HostAuth;->mAddress:Ljava/lang/String;

    .line 1097
    const-string p2, "port"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    iput p2, p1, Landroid/app/enterprise/HostAuth;->mPort:I

    .line 1098
    const-string p2, "flags"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    iput p2, p1, Landroid/app/enterprise/HostAuth;->mFlags:I

    .line 1099
    const/4 p2, 0x1

    iget v0, p1, Landroid/app/enterprise/HostAuth;->mFlags:I

    and-int/lit8 v0, v0, 0x1

    if-ne p2, v0, :cond_113

    const/4 p2, 0x1

    :goto_c4
    iput-boolean p2, p1, Landroid/app/enterprise/HostAuth;->mUseSSL:Z

    .line 1100
    const/4 p2, 0x2

    iget v0, p1, Landroid/app/enterprise/HostAuth;->mFlags:I

    and-int/lit8 v0, v0, 0x2

    if-ne p2, v0, :cond_115

    const/4 p2, 0x1

    :goto_ce
    iput-boolean p2, p1, Landroid/app/enterprise/HostAuth;->mUseTLS:Z

    .line 1101
    const/16 p2, 0x8

    iget v0, p1, Landroid/app/enterprise/HostAuth;->mFlags:I

    and-int/lit8 v0, v0, 0x8

    if-ne p2, v0, :cond_117

    const/4 p2, 0x1

    :goto_d9
    iput-boolean p2, p1, Landroid/app/enterprise/HostAuth;->mAcceptAllCertificates:Z

    .line 1102
    const-string p2, "login"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Landroid/app/enterprise/HostAuth;->mLogin:Ljava/lang/String;

    .line 1103
    const-string p2, "password"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Landroid/app/enterprise/HostAuth;->mPassword:Ljava/lang/String;

    .line 1104
    const-string p2, "domain"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Landroid/app/enterprise/HostAuth;->mDomain:Ljava/lang/String;

    .line 1105
    const-string p2, "accountKey"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    int-to-long v0, p2

    iput-wide v0, p1, Landroid/app/enterprise/HostAuth;->mAccountKey:J
    :try_end_10c
    .catchall {:try_start_80 .. :try_end_10c} :catchall_12a

    .line 1108
    :goto_10c
    if-eqz p0, :cond_111

    .line 1109
    :try_start_10e
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_111
    .catchall {:try_start_10e .. :try_end_111} :catchall_123

    .line 1111
    :cond_111
    monitor-exit v8

    return-object p1

    .line 1099
    :cond_113
    const/4 p2, 0x0

    goto :goto_c4

    .line 1100
    :cond_115
    const/4 p2, 0x0

    goto :goto_ce

    .line 1101
    :cond_117
    const/4 p2, 0x0

    goto :goto_d9

    .line 1108
    .end local p0           #c:Landroid/database/Cursor;
    .end local p1           #hAuth:Landroid/app/enterprise/HostAuth;
    .restart local v6       #c:Landroid/database/Cursor;
    .restart local v7       #hAuth:Landroid/app/enterprise/HostAuth;
    :catchall_119
    move-exception p0

    move-object p2, p0

    move-object p1, v7

    .end local v7           #hAuth:Landroid/app/enterprise/HostAuth;
    .restart local p1       #hAuth:Landroid/app/enterprise/HostAuth;
    move-object p0, v6

    .end local v6           #c:Landroid/database/Cursor;
    .restart local p0       #c:Landroid/database/Cursor;
    :goto_11d
    if-eqz p0, :cond_122

    .line 1109
    :try_start_11f
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 1108
    :cond_122
    throw p2
    :try_end_123
    .catchall {:try_start_11f .. :try_end_123} :catchall_123

    .line 1082
    :catchall_123
    move-exception p2

    .end local v2           #ID_PROJECTION:[Ljava/lang/String;
    :goto_124
    monitor-exit v8

    throw p2

    .line 1108
    .end local p1           #hAuth:Landroid/app/enterprise/HostAuth;
    .restart local v2       #ID_PROJECTION:[Ljava/lang/String;
    .restart local v7       #hAuth:Landroid/app/enterprise/HostAuth;
    :catchall_126
    move-exception p1

    move-object p2, p1

    move-object p1, v7

    .end local v7           #hAuth:Landroid/app/enterprise/HostAuth;
    .restart local p1       #hAuth:Landroid/app/enterprise/HostAuth;
    goto :goto_11d

    :catchall_12a
    move-exception p2

    goto :goto_11d

    .line 1082
    .end local v2           #ID_PROJECTION:[Ljava/lang/String;
    .end local p1           #hAuth:Landroid/app/enterprise/HostAuth;
    .restart local v6       #c:Landroid/database/Cursor;
    .restart local v7       #hAuth:Landroid/app/enterprise/HostAuth;
    .local p0, id:J
    .restart local p2
    :catchall_12c
    move-exception p0

    move-object p1, v7

    .end local v7           #hAuth:Landroid/app/enterprise/HostAuth;
    .end local p0           #id:J
    .restart local p1       #hAuth:Landroid/app/enterprise/HostAuth;
    move-object p2, p0

    move-object p0, v6

    .end local v6           #c:Landroid/database/Cursor;
    .local p0, c:Landroid/database/Cursor;
    goto :goto_124

    .end local p1           #hAuth:Landroid/app/enterprise/HostAuth;
    .end local p2
    .restart local v2       #ID_PROJECTION:[Ljava/lang/String;
    .restart local v7       #hAuth:Landroid/app/enterprise/HostAuth;
    :cond_131
    move-object p1, v7

    .end local v7           #hAuth:Landroid/app/enterprise/HostAuth;
    .restart local p1       #hAuth:Landroid/app/enterprise/HostAuth;
    goto :goto_10c
.end method

.method private static declared-synchronized getHostAuthFlags(IBBBLandroid/content/Context;)I
    .registers 10
    .parameter "existingFlag"
    .parameter "useSSL"
    .parameter "useTLS"
    .parameter "acceptAllCertificates"
    .parameter "mContext"

    .prologue
    const/4 v4, 0x1

    .line 554
    const-class v1, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v1

    move v0, p0

    .line 557
    .local v0, flag:I
    if-ne v4, p1, :cond_13

    .line 558
    or-int/lit8 v0, v0, 0x1

    .line 563
    :cond_9
    :goto_9
    if-ne v4, p2, :cond_1a

    .line 564
    or-int/lit8 v0, v0, 0x2

    .line 569
    :cond_d
    :goto_d
    if-ne v4, p3, :cond_22

    .line 570
    or-int/lit8 v0, v0, 0x8

    .line 574
    :cond_11
    :goto_11
    monitor-exit v1

    return v0

    .line 559
    :cond_13
    and-int/lit8 v2, v0, 0x1

    if-ne v4, v2, :cond_9

    .line 560
    xor-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 565
    :cond_1a
    const/4 v2, 0x2

    and-int/lit8 v3, v0, 0x2

    if-ne v2, v3, :cond_d

    .line 566
    xor-int/lit8 v0, v0, 0x2

    goto :goto_d

    .line 571
    :cond_22
    const/16 v2, 0x8

    and-int/lit8 v3, v0, 0x8

    if-ne v2, v3, :cond_11

    .line 572
    xor-int/lit8 v0, v0, 0x8

    goto :goto_11
.end method

.method public static declared-synchronized getValidStr(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .parameter "str"

    .prologue
    const/4 v3, 0x0

    .line 73
    const-class v1, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v1

    if-nez p0, :cond_9

    move-object v2, v3

    .line 77
    :goto_7
    monitor-exit v1

    return-object v2

    .line 73
    :cond_9
    :try_start_9
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I
    :try_end_10
    .catchall {:try_start_9 .. :try_end_10} :catchall_1e
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_10} :catch_17

    move-result v2

    if-lez v2, :cond_15

    move-object v2, p0

    goto :goto_7

    :cond_15
    move-object v2, v3

    goto :goto_7

    .line 74
    :catch_17
    move-exception v2

    move-object v0, v2

    .line 75
    .local v0, e:Ljava/lang/Exception;
    :try_start_19
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1e

    move-object v2, v3

    .line 77
    goto :goto_7

    .line 73
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_1e
    move-exception v2

    monitor-exit v1

    throw v2
.end method

.method private static declared-synchronized insertAccountTableRow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJIBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;ZZLandroid/app/enterprise/Account;Landroid/content/Context;)J
    .registers 33
    .parameter "displayName"
    .parameter "emailAddress"
    .parameter "syncKey"
    .parameter "syncLookback"
    .parameter "syncInterval"
    .parameter "hostAuthKeyRecv"
    .parameter "hostAuthKeySend"
    .parameter "settingsFlags"
    .parameter "isDefault"
    .parameter "compatibilityUuid"
    .parameter "senderName"
    .parameter "ringtoneUri"
    .parameter "protocolVersion"
    .parameter "newMessageCount"
    .parameter "securityFlags"
    .parameter "securitySyncKey"
    .parameter "signature"
    .parameter "isEasAccount"
    .parameter "isInsertOP"
    .parameter "existingAccInfo"
    .parameter "mContext"

    .prologue
    .line 695
    const-class v7, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v7

    const-wide/16 v5, -0x1

    .line 697
    .local v5, rowId:J
    :try_start_5
    invoke-static {p0}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 698
    invoke-static {p1}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 699
    invoke-static {p2}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 700
    invoke-static/range {p11 .. p11}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p11

    .line 701
    invoke-static/range {p12 .. p12}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p12

    .line 702
    invoke-static/range {p13 .. p13}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p13

    .line 703
    invoke-static/range {p14 .. p14}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p14

    .line 704
    invoke-static/range {p17 .. p17}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p17

    .line 705
    invoke-static/range {p18 .. p18}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p18

    .line 707
    if-nez p0, :cond_2c

    .line 708
    move-object p0, p1

    .line 710
    :cond_2c
    if-eqz p0, :cond_4c

    if-eqz p1, :cond_4c

    if-eqz p11, :cond_4c

    if-eqz p13, :cond_4c

    const/4 v8, 0x1

    if-gt v8, p3, :cond_4c

    const/4 v8, 0x5

    if-lt v8, p3, :cond_4c

    const-wide/16 v8, 0x1

    cmp-long v8, v8, p5

    if-gtz v8, :cond_4c

    const-wide/16 v8, 0x1

    cmp-long v8, v8, p7

    if-gtz v8, :cond_4c

    const/4 v8, 0x1

    move v0, v8

    move/from16 v1, p9

    if-le v0, v1, :cond_57

    .line 712
    :cond_4c
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p3, "insertAccountTableRow : Error :: Invalid input parameters."

    .end local p3
    invoke-static {p0, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_53
    .catchall {:try_start_5 .. :try_end_53} :catchall_1f4

    move-wide p0, v5

    .end local v5           #rowId:J
    .end local p1
    .local p0, rowId:J
    move-wide p2, v5

    .line 771
    .end local p0           #rowId:J
    .end local p4
    .end local p5
    .end local p19
    .local p2, rowId:J
    :goto_55
    monitor-exit v7

    return-wide p2

    .line 715
    .restart local v5       #rowId:J
    .local p0, displayName:Ljava/lang/String;
    .restart local p1
    .local p2, syncKey:Ljava/lang/String;
    .restart local p3
    .restart local p4
    .restart local p5
    .restart local p19
    :cond_57
    if-eqz p19, :cond_67

    if-eqz p2, :cond_5d

    if-nez p14, :cond_67

    .line 716
    :cond_5d
    :try_start_5d
    const-string p0, "SettingsUtils"

    .end local p0           #displayName:Ljava/lang/String;
    const-string p3, "insertAccountTableRow : Error :: Invalid input parameters."

    .end local p3
    invoke-static {p0, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-wide p0, v5

    .end local v5           #rowId:J
    .end local p1
    .local p0, rowId:J
    move-wide p2, v5

    .line 717
    .end local p0           #rowId:J
    .local p2, rowId:J
    goto :goto_55

    .line 719
    .restart local v5       #rowId:J
    .local p0, displayName:Ljava/lang/String;
    .restart local p1
    .local p2, syncKey:Ljava/lang/String;
    .restart local p3
    :cond_67
    if-nez p19, :cond_75

    if-nez p12, :cond_75

    .line 720
    const-string p0, "SettingsUtils"

    .end local p0           #displayName:Ljava/lang/String;
    const-string p3, "insertAccountTableRow : Error :: Invalid input parameters."

    .end local p3
    invoke-static {p0, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-wide p0, v5

    .end local v5           #rowId:J
    .end local p1
    .local p0, rowId:J
    move-wide p2, v5

    .line 721
    .end local p0           #rowId:J
    .local p2, rowId:J
    goto :goto_55

    .line 724
    .restart local v5       #rowId:J
    .local p0, displayName:Ljava/lang/String;
    .restart local p1
    .local p2, syncKey:Ljava/lang/String;
    .restart local p3
    :cond_75
    const/16 p15, 0x0

    .line 725
    const/16 p16, 0x0

    .line 727
    new-instance p19, Landroid/content/ContentValues;

    .end local p19
    invoke-direct/range {p19 .. p19}, Landroid/content/ContentValues;-><init>()V

    .line 729
    .local p19, values:Landroid/content/ContentValues;
    const-string v8, "displayName"

    move-object/from16 v0, p19

    move-object v1, v8

    move-object v2, p0

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 730
    const-string p0, "emailAddress"

    .end local p0           #displayName:Ljava/lang/String;
    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p1

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    if-eqz p2, :cond_9b

    .line 732
    const-string p0, "syncKey"

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 733
    :cond_9b
    const-string p0, "syncLookback"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    .end local p3
    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 734
    const-string p0, "syncInterval"

    invoke-static {p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 735
    const-string p0, "offPeakSchedule"

    invoke-static {p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 736
    const-string p0, "hostAuthKeyRecv"

    long-to-int p3, p5

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 737
    const-string p0, "hostAuthKeySend"

    move-wide/from16 v0, p7

    long-to-int v0, v0

    move p3, v0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 738
    const-string p0, "flags"

    invoke-static/range {p9 .. p9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 739
    const-string p0, "isDefault"

    const/4 p3, 0x1

    move v0, p3

    move/from16 v1, p10

    if-ne v0, v1, :cond_1b4

    const/4 p3, 0x1

    :goto_f7
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 740
    const-string p0, "compatibilityUuid"

    move-object/from16 v0, p19

    move-object v1, p0

    move-object/from16 v2, p11

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 741
    if-eqz p12, :cond_118

    .line 742
    const-string p0, "senderName"

    move-object/from16 v0, p19

    move-object v1, p0

    move-object/from16 v2, p12

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 743
    :cond_118
    const-string p0, "ringtoneUri"

    move-object/from16 v0, p19

    move-object v1, p0

    move-object/from16 v2, p13

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 744
    if-eqz p14, :cond_12e

    .line 745
    const-string p0, "protocolVersion"

    move-object/from16 v0, p19

    move-object v1, p0

    move-object/from16 v2, p14

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 746
    :cond_12e
    if-eqz p20, :cond_14a

    .line 747
    const-string p0, "newMessageCount"

    invoke-static/range {p15 .. p15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 748
    const-string p0, "securityFlags"

    invoke-static/range {p16 .. p16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    move-object/from16 v0, p19

    move-object v1, p0

    move-object v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 750
    :cond_14a
    if-eqz p17, :cond_156

    .line 751
    const-string p0, "securitySyncKey"

    move-object/from16 v0, p19

    move-object v1, p0

    move-object/from16 v2, p17

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 752
    :cond_156
    if-eqz p18, :cond_162

    .line 753
    const-string p0, "signature"

    move-object/from16 v0, p19

    move-object v1, p0

    move-object/from16 v2, p18

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 755
    :cond_162
    invoke-virtual/range {p19 .. p19}, Landroid/content/ContentValues;->size()I
    :try_end_165
    .catchall {:try_start_5d .. :try_end_165} :catchall_1f4

    move-result p0

    if-lez p0, :cond_1fc

    .line 757
    if-eqz p20, :cond_1b7

    .line 758
    :try_start_16a
    invoke-virtual/range {p22 .. p22}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object p3, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    move-object v0, p0

    move-object v1, p3

    move-object/from16 v2, p19

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p0

    .line 759
    .local p0, newRowUri:Landroid/net/Uri;
    const-string p3, "SettingsUtils"

    new-instance p4, Ljava/lang/StringBuilder;

    .end local p4
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "insertAccountTableRow rowUri : "

    .end local p5
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p3, p4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 760
    invoke-static {p0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J
    :try_end_197
    .catchall {:try_start_16a .. :try_end_197} :catchall_1f4
    .catch Ljava/lang/Exception; {:try_start_16a .. :try_end_197} :catch_1eb

    move-result-wide p3

    .line 765
    .end local v5           #rowId:J
    .end local p0           #newRowUri:Landroid/net/Uri;
    .local p3, rowId:J
    :goto_198
    :try_start_198
    const-string p0, "SettingsUtils"

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string p6, "insertAccountTableRow row Id : "

    invoke-virtual/range {p5 .. p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {p0, p5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1b0
    .catchall {:try_start_198 .. :try_end_1b0} :catchall_1fa
    .catch Ljava/lang/Exception; {:try_start_198 .. :try_end_1b0} :catch_1f8

    move-wide p0, p3

    .end local p1
    .end local p3           #rowId:J
    .local p0, rowId:J
    :goto_1b1
    move-wide p2, p0

    .line 771
    .end local p0           #rowId:J
    .local p2, rowId:J
    goto/16 :goto_55

    .line 739
    .restart local v5       #rowId:J
    .restart local p1
    .local p2, syncKey:Ljava/lang/String;
    .restart local p4
    .restart local p5
    :cond_1b4
    const/4 p3, 0x0

    goto/16 :goto_f7

    .line 762
    :cond_1b7
    :try_start_1b7
    invoke-virtual/range {p22 .. p22}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object p3, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    new-instance p4, Ljava/lang/StringBuilder;

    .end local p4
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "_id = "

    .end local p5
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    move-object/from16 v0, p21

    iget v0, v0, Landroid/app/enterprise/Account;->mId:I

    move p5, v0

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    const/4 p5, 0x0

    move-object v0, p0

    move-object v1, p3

    move-object/from16 v2, p19

    move-object v3, p4

    move-object v4, p5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    .line 763
    .local p0, rowCount:I
    if-lez p0, :cond_1e9

    move-object/from16 v0, p21

    iget v0, v0, Landroid/app/enterprise/Account;->mId:I

    move p0, v0
    :try_end_1e7
    .catchall {:try_start_1b7 .. :try_end_1e7} :catchall_1f4
    .catch Ljava/lang/Exception; {:try_start_1b7 .. :try_end_1e7} :catch_1eb

    .end local p0           #rowCount:I
    :goto_1e7
    int-to-long p3, p0

    .end local v5           #rowId:J
    .restart local p3       #rowId:J
    goto :goto_198

    .end local p3           #rowId:J
    .restart local v5       #rowId:J
    .restart local p0       #rowCount:I
    :cond_1e9
    const/4 p0, -0x1

    goto :goto_1e7

    .line 766
    .end local p0           #rowCount:I
    :catch_1eb
    move-exception p0

    move-wide p3, v5

    .line 767
    .end local v5           #rowId:J
    .local p0, e:Ljava/lang/Exception;
    .restart local p3       #rowId:J
    :goto_1ed
    const-wide/16 p3, -0x1

    .line 768
    :try_start_1ef
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1f2
    .catchall {:try_start_1ef .. :try_end_1f2} :catchall_1fa

    move-wide p0, p3

    .end local p1
    .end local p3           #rowId:J
    .local p0, rowId:J
    goto :goto_1b1

    .line 695
    .end local p0           #rowId:J
    .end local p19           #values:Landroid/content/ContentValues;
    .restart local v5       #rowId:J
    .restart local p1
    :catchall_1f4
    move-exception p0

    move-wide p3, v5

    .end local v5           #rowId:J
    .restart local p3       #rowId:J
    :goto_1f6
    monitor-exit v7

    throw p0

    .line 766
    .restart local p19       #values:Landroid/content/ContentValues;
    :catch_1f8
    move-exception p0

    goto :goto_1ed

    .line 695
    :catchall_1fa
    move-exception p0

    goto :goto_1f6

    .end local p3           #rowId:J
    .restart local v5       #rowId:J
    .restart local p4
    .restart local p5
    :cond_1fc
    move-wide p0, v5

    .end local v5           #rowId:J
    .end local p1
    .restart local p0       #rowId:J
    goto :goto_1b1
.end method

.method private static declared-synchronized insertAccountsTableRow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/app/enterprise/Account;Landroid/content/Context;)J
    .registers 16
    .parameter "name"
    .parameter "type"
    .parameter "password"
    .parameter "isInsertOP"
    .parameter "existingAccInfo"
    .parameter "mContext"

    .prologue
    .line 578
    const-class v4, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v4

    const/4 v0, 0x0

    .line 579
    .local v0, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    const-wide/16 v1, -0x1

    .line 580
    .local v1, rowId:J
    :try_start_6
    invoke-static {p0}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 581
    invoke-static {p1}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 582
    invoke-static {p2}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;
    :try_end_11
    .catchall {:try_start_6 .. :try_end_11} :catchall_c8

    move-result-object p2

    .line 584
    if-eqz p0, :cond_a9

    if-eqz p1, :cond_a9

    if-eqz p2, :cond_a9

    .line 586
    :try_start_18
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 587
    .local v3, values:Landroid/content/ContentValues;
    const-string v5, "name"

    invoke-virtual {v3, v5, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    const-string p0, "type"

    .end local p0
    invoke-virtual {v3, p0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    const-string p0, "password"

    invoke-virtual {v3, p0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    const-string p0, "/data/system/accounts.db"

    .line 592
    .local p0, accountsDBPath:Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {p0, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_33
    .catchall {:try_start_18 .. :try_end_33} :catchall_9c
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_33} :catch_8c

    move-result-object p0

    .line 593
    .end local v0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .local p0, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    if-eqz p3, :cond_5e

    .line 594
    :try_start_36
    const-string p3, "accounts"

    .end local p3
    const-string p4, "doesn\'t exist at all"

    .end local p4
    invoke-virtual {p0, p3, p4, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_3d
    .catchall {:try_start_36 .. :try_end_3d} :catchall_b3
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_3d} :catch_bf

    move-result-wide p3

    .line 602
    .end local v1           #rowId:J
    .end local p5
    .local p3, rowId:J
    :goto_3e
    :try_start_3e
    const-string p5, "SettingsUtils"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "insertAccountsTableRow row Id : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_56
    .catchall {:try_start_3e .. :try_end_56} :catchall_b7
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_56} :catch_c2

    .line 607
    if-eqz p0, :cond_5b

    .line 608
    :try_start_58
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_5b
    .catchall {:try_start_58 .. :try_end_5b} :catchall_a6

    :cond_5b
    move-wide p1, p3

    .line 614
    .end local v3           #values:Landroid/content/ContentValues;
    .end local p2
    .end local p3           #rowId:J
    .local p1, rowId:J
    :goto_5c
    monitor-exit v4

    return-wide p1

    .line 596
    .restart local v1       #rowId:J
    .restart local v3       #values:Landroid/content/ContentValues;
    .local p1, type:Ljava/lang/String;
    .restart local p2
    .local p3, isInsertOP:Z
    .restart local p4
    .restart local p5
    :cond_5e
    :try_start_5e
    iget-object p3, p4, Landroid/app/enterprise/Account;->mEmailAddress:Ljava/lang/String;

    .end local p3           #isInsertOP:Z
    const-string p4, "com.android.exchange"

    .end local p4
    invoke-static {p3, p4, p5}, Lcom/android/server/enterprise/SettingsUtils;->getAccountsDBRowId(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)J

    move-result-wide p3

    .line 597
    .local p3, accountsDBRowId:J
    const-wide/16 v5, -0x1

    cmp-long p5, v5, p3

    if-eqz p5, :cond_d2

    .line 598
    .end local p5
    const-string p5, "accounts"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id = "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x0

    invoke-virtual {p0, p5, v3, v0, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_85
    .catchall {:try_start_5e .. :try_end_85} :catchall_b3
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_85} :catch_bf

    move-result p5

    .line 599
    .local p5, rowCount:I
    if-lez p5, :cond_89

    .end local v1           #rowId:J
    .local p3, rowId:J
    :goto_88
    goto :goto_3e

    .restart local v1       #rowId:J
    .local p3, accountsDBRowId:J
    :cond_89
    const-wide/16 p3, -0x1

    goto :goto_88

    .line 603
    .end local v3           #values:Landroid/content/ContentValues;
    .end local p0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .local p3, isInsertOP:Z
    .restart local p4
    .local p5, mContext:Landroid/content/Context;
    :catch_8c
    move-exception p0

    move-object p3, p0

    move-wide p4, v1

    .end local v1           #rowId:J
    .end local p5           #mContext:Landroid/content/Context;
    .local p4, rowId:J
    move-object p0, v0

    .line 604
    .end local v0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local p0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .local p3, e:Ljava/lang/Exception;
    :goto_90
    const-wide/16 p4, -0x1

    .line 605
    :try_start_92
    invoke-virtual {p3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_95
    .catchall {:try_start_92 .. :try_end_95} :catchall_b9

    .line 607
    if-eqz p0, :cond_9a

    .line 608
    :try_start_97
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_9a
    .catchall {:try_start_97 .. :try_end_9a} :catchall_cd

    :cond_9a
    move-wide p1, p4

    .line 610
    .end local p2
    .end local p4           #rowId:J
    .local p1, rowId:J
    goto :goto_5c

    .line 607
    .end local p0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v1       #rowId:J
    .local p1, type:Ljava/lang/String;
    .restart local p2
    .local p3, isInsertOP:Z
    .local p4, existingAccInfo:Landroid/app/enterprise/Account;
    .restart local p5       #mContext:Landroid/content/Context;
    :catchall_9c
    move-exception p0

    move-object p5, p0

    move-wide p3, v1

    .end local v1           #rowId:J
    .end local p4           #existingAccInfo:Landroid/app/enterprise/Account;
    .local p3, rowId:J
    move-object p0, v0

    .end local v0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .end local p5           #mContext:Landroid/content/Context;
    .restart local p0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    :goto_a0
    if-eqz p0, :cond_a5

    .line 608
    :try_start_a2
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 607
    :cond_a5
    throw p5
    :try_end_a6
    .catchall {:try_start_a2 .. :try_end_a6} :catchall_a6

    .line 578
    :catchall_a6
    move-exception p5

    :goto_a7
    monitor-exit v4

    throw p5

    .line 612
    .restart local v0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v1       #rowId:J
    .local p0, name:Ljava/lang/String;
    .local p3, isInsertOP:Z
    .restart local p4       #existingAccInfo:Landroid/app/enterprise/Account;
    .restart local p5       #mContext:Landroid/content/Context;
    :cond_a9
    :try_start_a9
    const-string p0, "SettingsUtils"

    .end local p0           #name:Ljava/lang/String;
    const-string p3, "insertAccountsTableRow : Error :: Invalid input parameters."

    .end local p3           #isInsertOP:Z
    invoke-static {p0, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b0
    .catchall {:try_start_a9 .. :try_end_b0} :catchall_c8

    move-wide p1, v1

    .end local v1           #rowId:J
    .end local p2
    .local p1, rowId:J
    move-object p0, v0

    .end local v0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .local p0, accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    goto :goto_5c

    .line 607
    .end local p4           #existingAccInfo:Landroid/app/enterprise/Account;
    .end local p5           #mContext:Landroid/content/Context;
    .restart local v1       #rowId:J
    .restart local v3       #values:Landroid/content/ContentValues;
    .local p1, type:Ljava/lang/String;
    .restart local p2
    :catchall_b3
    move-exception p3

    move-object p5, p3

    move-wide p3, v1

    .end local v1           #rowId:J
    .local p3, rowId:J
    goto :goto_a0

    :catchall_b7
    move-exception p5

    goto :goto_a0

    .end local v3           #values:Landroid/content/ContentValues;
    .local p3, e:Ljava/lang/Exception;
    .local p4, rowId:J
    :catchall_b9
    move-exception p3

    move-object v7, p3

    move-wide v8, p4

    .end local p4           #rowId:J
    .local v8, rowId:J
    move-wide p3, v8

    .end local v8           #rowId:J
    .local p3, rowId:J
    move-object p5, v7

    goto :goto_a0

    .line 603
    .end local p3           #rowId:J
    .restart local v1       #rowId:J
    .restart local v3       #values:Landroid/content/ContentValues;
    :catch_bf
    move-exception p3

    move-wide p4, v1

    .end local v1           #rowId:J
    .restart local p4       #rowId:J
    goto :goto_90

    .end local p4           #rowId:J
    .restart local p3       #rowId:J
    :catch_c2
    move-exception p5

    move-object v7, p5

    move-wide v8, p3

    .end local p3           #rowId:J
    .restart local v8       #rowId:J
    move-wide p4, v8

    .end local v8           #rowId:J
    .restart local p4       #rowId:J
    move-object p3, v7

    goto :goto_90

    .line 578
    .end local v3           #values:Landroid/content/ContentValues;
    .end local p0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v1       #rowId:J
    .local p4, existingAccInfo:Landroid/app/enterprise/Account;
    .restart local p5       #mContext:Landroid/content/Context;
    :catchall_c8
    move-exception p0

    move-wide p3, v1

    .end local v1           #rowId:J
    .end local p4           #existingAccInfo:Landroid/app/enterprise/Account;
    .restart local p3       #rowId:J
    move-object p5, p0

    move-object p0, v0

    .end local v0           #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    .restart local p0       #accountsDB:Landroid/database/sqlite/SQLiteDatabase;
    goto :goto_a7

    .end local p5           #mContext:Landroid/content/Context;
    .local p3, e:Ljava/lang/Exception;
    .local p4, rowId:J
    :catchall_cd
    move-exception p3

    move-wide v7, p4

    .end local p4           #rowId:J
    .local v7, rowId:J
    move-object p5, p3

    move-wide p3, v7

    .end local v7           #rowId:J
    .local p3, rowId:J
    goto :goto_a7

    .restart local v1       #rowId:J
    .restart local v3       #values:Landroid/content/ContentValues;
    .local p3, accountsDBRowId:J
    :cond_d2
    move-wide p3, v1

    .end local v1           #rowId:J
    .local p3, rowId:J
    goto/16 :goto_3e
.end method

.method private static declared-synchronized insertHostAuthTableRow(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/app/enterprise/Account;ZLandroid/content/Context;)J
    .registers 22
    .parameter "protocol"
    .parameter "address"
    .parameter "port"
    .parameter "flags"
    .parameter "login"
    .parameter "password"
    .parameter "domain"
    .parameter "isInsertOP"
    .parameter "existingAccInfo"
    .parameter "isHostAuthRecv"
    .parameter "mContext"

    .prologue
    .line 776
    const-class v9, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v9

    const-wide/16 v6, -0x1

    .line 777
    .local v6, rowId:J
    const/4 v5, 0x0

    .line 778
    .local v5, inputdataError:Z
    :try_start_6
    invoke-static {p0}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 779
    invoke-static {p1}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 780
    invoke-static {p4}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 781
    invoke-static/range {p5 .. p5}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    .line 782
    invoke-static/range {p6 .. p6}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p6

    .line 784
    if-eqz p0, :cond_22

    if-eqz p1, :cond_22

    if-eqz p4, :cond_22

    if-nez p5, :cond_32

    .line 785
    :cond_22
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p7, "insertHostAuthTableRow : Error :: Invalid input parameters."

    .end local p7
    move-object v0, p0

    move-object/from16 v1, p7

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2c
    .catchall {:try_start_6 .. :try_end_2c} :catchall_126

    move p0, v5

    .end local v5           #inputdataError:Z
    .local p0, inputdataError:Z
    move-wide p4, v6

    .end local v6           #rowId:J
    .end local p5
    .local p4, rowId:J
    move-wide/from16 p6, v6

    .line 831
    .end local p1
    .end local p4           #rowId:J
    .end local p8
    .end local p9
    .end local p10
    .local p6, rowId:J
    :goto_30
    monitor-exit v9

    return-wide p6

    .line 788
    .restart local v5       #inputdataError:Z
    .restart local v6       #rowId:J
    .local p0, protocol:Ljava/lang/String;
    .restart local p1
    .local p4, login:Ljava/lang/String;
    .restart local p5
    .local p6, domain:Ljava/lang/String;
    .restart local p7
    .restart local p8
    .restart local p9
    .restart local p10
    :cond_32
    if-gez p3, :cond_35

    .line 789
    const/4 p3, 0x0

    .line 790
    :cond_35
    if-gtz p2, :cond_40

    .line 791
    :try_start_37
    const-string v8, "eas"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_3c
    .catchall {:try_start_37 .. :try_end_3c} :catchall_126

    move-result v8

    if-eqz v8, :cond_c7

    .line 792
    const/4 p2, 0x0

    .line 798
    :cond_40
    :goto_40
    if-nez v5, :cond_11a

    .line 799
    :try_start_42
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 801
    .local v8, values:Landroid/content/ContentValues;
    const-string v10, "protocol"

    invoke-virtual {v8, v10, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 802
    const-string p0, "address"

    .end local p0           #protocol:Ljava/lang/String;
    invoke-virtual {v8, p0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 803
    const-string p0, "port"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, p0, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 804
    const-string p0, "flags"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, p0, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 805
    const-string p0, "login"

    invoke-virtual {v8, p0, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 806
    const-string p0, "password"

    move-object v0, v8

    move-object v1, p0

    move-object/from16 v2, p5

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 807
    if-eqz p6, :cond_7c

    .line 808
    const-string p0, "domain"

    move-object v0, v8

    move-object v1, p0

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 810
    :cond_7c
    const-string p0, "accountKey"

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, p0, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 812
    invoke-virtual {v8}, Landroid/content/ContentValues;->size()I
    :try_end_89
    .catchall {:try_start_42 .. :try_end_89} :catchall_130

    move-result p0

    if-lez p0, :cond_124

    .line 814
    if-eqz p7, :cond_ca

    .line 815
    :try_start_8e
    invoke-virtual/range {p10 .. p10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object p7, Lcom/android/server/enterprise/SettingsUtils;->HOST_AUTH_CONTENT_URI:Landroid/net/Uri;

    .end local p7
    move-object v0, p0

    move-object/from16 v1, p7

    move-object v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p0

    .line 816
    .local p0, newRowUri:Landroid/net/Uri;
    invoke-static {p0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J
    :try_end_9f
    .catchall {:try_start_8e .. :try_end_9f} :catchall_130
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_9f} :catch_10f

    move-result-wide p7

    .line 822
    .end local v6           #rowId:J
    .end local p0           #newRowUri:Landroid/net/Uri;
    .end local p8
    .end local p9
    .end local p10
    .local p7, rowId:J
    :goto_a0
    :try_start_a0
    const-string p0, "SettingsUtils"

    new-instance p9, Ljava/lang/StringBuilder;

    invoke-direct/range {p9 .. p9}, Ljava/lang/StringBuilder;-><init>()V

    const-string p10, "insertHostAuthTableRow row Id : "

    invoke-virtual/range {p9 .. p10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p9

    move-object/from16 v0, p9

    move-wide/from16 v1, p7

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p9

    invoke-virtual/range {p9 .. p9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p9

    move-object v0, p0

    move-object/from16 v1, p9

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_bf
    .catchall {:try_start_a0 .. :try_end_bf} :catchall_137
    .catch Ljava/lang/Exception; {:try_start_a0 .. :try_end_bf} :catch_12e

    move-wide/from16 p0, p7

    .end local v8           #values:Landroid/content/ContentValues;
    .end local p1
    .end local p7           #rowId:J
    .local p0, rowId:J
    :goto_c1
    move-wide p4, p0

    .end local p0           #rowId:J
    .end local p5
    .local p4, rowId:J
    move-wide/from16 p6, p0

    .end local p4           #rowId:J
    .local p6, rowId:J
    move p0, v5

    .line 831
    .end local v5           #inputdataError:Z
    .local p0, inputdataError:Z
    goto/16 :goto_30

    .line 794
    .restart local v5       #inputdataError:Z
    .restart local v6       #rowId:J
    .local p0, protocol:Ljava/lang/String;
    .restart local p1
    .local p4, login:Ljava/lang/String;
    .restart local p5
    .local p6, domain:Ljava/lang/String;
    .local p7, isInsertOP:Z
    .restart local p8
    .restart local p9
    .restart local p10
    :cond_c7
    const/4 v5, 0x1

    goto/16 :goto_40

    .line 818
    .end local p0           #protocol:Ljava/lang/String;
    .restart local v8       #values:Landroid/content/ContentValues;
    :cond_ca
    if-eqz p9, :cond_105

    :try_start_cc
    move-object/from16 v0, p8

    iget-object v0, v0, Landroid/app/enterprise/Account;->mHostAuthRecv:Landroid/app/enterprise/HostAuth;

    move-object p0, v0

    iget p0, p0, Landroid/app/enterprise/HostAuth;->mId:I

    .line 819
    .local p0, existingHostAuthRowId:I
    :goto_d3
    invoke-virtual/range {p10 .. p10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p7

    .end local p7           #isInsertOP:Z
    sget-object p8, Lcom/android/server/enterprise/SettingsUtils;->HOST_AUTH_CONTENT_URI:Landroid/net/Uri;

    .end local p8
    new-instance p9, Ljava/lang/StringBuilder;

    .end local p9
    invoke-direct/range {p9 .. p9}, Ljava/lang/StringBuilder;-><init>()V

    const-string p10, "_id = "

    .end local p10
    invoke-virtual/range {p9 .. p10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p9

    move-object/from16 v0, p9

    move v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p9

    invoke-virtual/range {p9 .. p9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p9

    const/16 p10, 0x0

    move-object/from16 v0, p7

    move-object/from16 v1, p8

    move-object v2, v8

    move-object/from16 v3, p9

    move-object/from16 v4, p10

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p7

    .line 820
    .local p7, rowCount:I
    if-lez p7, :cond_10d

    .end local p0           #existingHostAuthRowId:I
    :goto_100
    move v0, p0

    int-to-long v0, v0

    move-wide/from16 p7, v0

    .end local v6           #rowId:J
    .local p7, rowId:J
    goto :goto_a0

    .line 818
    .restart local v6       #rowId:J
    .local p7, isInsertOP:Z
    .restart local p8
    .restart local p9
    .restart local p10
    :cond_105
    move-object/from16 v0, p8

    iget-object v0, v0, Landroid/app/enterprise/Account;->mHostAuthSend:Landroid/app/enterprise/HostAuth;

    move-object p0, v0

    iget p0, p0, Landroid/app/enterprise/HostAuth;->mId:I
    :try_end_10c
    .catchall {:try_start_cc .. :try_end_10c} :catchall_130
    .catch Ljava/lang/Exception; {:try_start_cc .. :try_end_10c} :catch_10f

    goto :goto_d3

    .line 820
    .end local p8
    .end local p9
    .end local p10
    .restart local p0       #existingHostAuthRowId:I
    .local p7, rowCount:I
    :cond_10d
    const/4 p0, -0x1

    goto :goto_100

    .line 823
    .end local p0           #existingHostAuthRowId:I
    .end local p7           #rowCount:I
    :catch_10f
    move-exception p0

    move-wide/from16 p7, v6

    .line 824
    .end local v6           #rowId:J
    .local p0, e:Ljava/lang/Exception;
    .local p7, rowId:J
    :goto_112
    const-wide/16 p7, -0x1

    .line 825
    :try_start_114
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_117
    .catchall {:try_start_114 .. :try_end_117} :catchall_137

    move-wide/from16 p0, p7

    .end local p1
    .end local p7           #rowId:J
    .local p0, rowId:J
    goto :goto_c1

    .line 829
    .end local v8           #values:Landroid/content/ContentValues;
    .restart local v6       #rowId:J
    .local p0, protocol:Ljava/lang/String;
    .restart local p1
    .local p7, isInsertOP:Z
    .restart local p8
    .restart local p9
    .restart local p10
    :cond_11a
    :try_start_11a
    const-string p0, "SettingsUtils"

    .end local p0           #protocol:Ljava/lang/String;
    const-string p7, "insertHostAuthTableRow : Error :: Invalid input parameters."

    .end local p7           #isInsertOP:Z
    move-object v0, p0

    move-object/from16 v1, p7

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_124
    .catchall {:try_start_11a .. :try_end_124} :catchall_130

    :cond_124
    move-wide p0, v6

    .end local v6           #rowId:J
    .end local p1
    .local p0, rowId:J
    goto :goto_c1

    .line 776
    .end local p0           #rowId:J
    .restart local v6       #rowId:J
    .restart local p1
    :catchall_126
    move-exception p0

    move-wide/from16 p7, v6

    .end local v6           #rowId:J
    .end local p8
    .local p7, rowId:J
    move-object/from16 p9, p0

    move p0, v5

    .end local v5           #inputdataError:Z
    .end local p9
    .end local p10
    .local p0, inputdataError:Z
    :goto_12c
    monitor-exit v9

    throw p9

    .line 823
    .end local p0           #inputdataError:Z
    .restart local v5       #inputdataError:Z
    .restart local v8       #values:Landroid/content/ContentValues;
    :catch_12e
    move-exception p0

    goto :goto_112

    .line 776
    .end local v8           #values:Landroid/content/ContentValues;
    .end local p7           #rowId:J
    .restart local v6       #rowId:J
    :catchall_130
    move-exception p0

    move-wide/from16 p7, v6

    .end local v6           #rowId:J
    .restart local p7       #rowId:J
    move-object/from16 p9, p0

    move p0, v5

    .end local v5           #inputdataError:Z
    .restart local p0       #inputdataError:Z
    goto :goto_12c

    .end local p0           #inputdataError:Z
    .restart local v5       #inputdataError:Z
    .restart local v8       #values:Landroid/content/ContentValues;
    :catchall_137
    move-exception p0

    move-object/from16 p9, p0

    move p0, v5

    .end local v5           #inputdataError:Z
    .restart local p0       #inputdataError:Z
    goto :goto_12c
.end method

.method public static declared-synchronized isValidEmailAddress(Ljava/lang/String;)Z
    .registers 12
    .parameter "emailAddress"

    .prologue
    const/4 v10, 0x1

    .line 536
    const-class v7, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v7

    const/4 v3, 0x0

    .line 537
    .local v3, isValid:Z
    :try_start_5
    invoke-static {p0}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_43

    move-result-object p0

    .line 538
    if-eqz p0, :cond_38

    .line 540
    :try_start_b
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 541
    .local v6, len:I
    const/16 v8, 0x40

    invoke-virtual {p0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 542
    .local v1, firstAt:I
    const/16 v8, 0x40

    invoke-virtual {p0, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 543
    .local v4, lastAt:I
    const/16 v8, 0x2e

    add-int/lit8 v9, v4, 0x1

    invoke-virtual {p0, v8, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 544
    .local v2, firstDot:I
    const/16 v8, 0x2e

    invoke-virtual {p0, v8}, Ljava/lang/String;->lastIndexOf(I)I
    :try_end_28
    .catchall {:try_start_b .. :try_end_28} :catchall_43
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_28} :catch_3d

    move-result v5

    .line 545
    .local v5, lastDot:I
    if-lez v1, :cond_3a

    if-ne v1, v4, :cond_3a

    add-int/lit8 v8, v4, 0x1

    if-ge v8, v2, :cond_3a

    if-gt v2, v5, :cond_3a

    sub-int v8, v6, v10

    if-ge v5, v8, :cond_3a

    move v3, v10

    .line 550
    .end local v1           #firstAt:I
    .end local v2           #firstDot:I
    .end local v4           #lastAt:I
    .end local v5           #lastDot:I
    .end local v6           #len:I
    :cond_38
    :goto_38
    monitor-exit v7

    return v3

    .line 545
    .restart local v1       #firstAt:I
    .restart local v2       #firstDot:I
    .restart local v4       #lastAt:I
    .restart local v5       #lastDot:I
    .restart local v6       #len:I
    :cond_3a
    const/4 v8, 0x0

    move v3, v8

    goto :goto_38

    .line 546
    .end local v1           #firstAt:I
    .end local v2           #firstDot:I
    .end local v4           #lastAt:I
    .end local v5           #lastDot:I
    .end local v6           #len:I
    :catch_3d
    move-exception v8

    move-object v0, v8

    .line 547
    .local v0, e:Ljava/lang/Exception;
    :try_start_3f
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_43

    goto :goto_38

    .line 536
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_43
    move-exception v8

    monitor-exit v7

    throw v8
.end method

.method public static declared-synchronized loadNewValuesInAccountMetaData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;BBLjava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/server/enterprise/AccountMetaData;)V
    .registers 34
    .parameter "displayName"
    .parameter "emailAddress"
    .parameter "easUser"
    .parameter "easDomain"
    .parameter "syncLookback"
    .parameter "syncInterval"
    .parameter "isDefault"
    .parameter "senderName"
    .parameter "protocolVersion"
    .parameter "signature"
    .parameter "emailNotificationVibrateAlways"
    .parameter "emailNotificationVibrateWhenSilent"
    .parameter "inComingProtocol"
    .parameter "inComingServerAddress"
    .parameter "inComingServerPort"
    .parameter "inComingServerUseSSL"
    .parameter "inComingServerUseTLS"
    .parameter "inComingServerAcceptAllCertificates"
    .parameter "inComingServerLogin"
    .parameter "inComingServerPassword"
    .parameter "inComingServerPathPrefix"
    .parameter "outGoingProtocol"
    .parameter "outGoingServerAddress"
    .parameter "outGoingServerPort"
    .parameter "outGoingServerUseSSL"
    .parameter "outGoingServerUseTLS"
    .parameter "outGoingServerAcceptAllCertificates"
    .parameter "outGoingServerLogin"
    .parameter "outGoingServerPassword"
    .parameter "outGoingServerPathPrefix"
    .parameter "accountMData"

    .prologue
    .line 196
    const-class v2, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v2

    if-eqz p0, :cond_a

    .line 197
    :try_start_5
    move-object v0, p0

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mDisplayName:Ljava/lang/String;

    .line 198
    :cond_a
    if-eqz p1, :cond_11

    .line 199
    move-object v0, p1

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mEmailAddress:Ljava/lang/String;

    .line 200
    :cond_11
    if-eqz p2, :cond_18

    .line 201
    move-object v0, p2

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mEasUser:Ljava/lang/String;

    .line 202
    :cond_18
    if-eqz p3, :cond_1f

    .line 203
    move-object v0, p3

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mEasDomain:Ljava/lang/String;

    .line 204
    :cond_1f
    const/16 p0, -0x64

    if-eq p0, p4, :cond_28

    .line 205
    .end local p0
    move v0, p4

    move-object/from16 v1, p30

    iput v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mSyncLookback:I

    .line 206
    :cond_28
    const/16 p0, -0x64

    if-eq p0, p5, :cond_31

    .line 207
    move v0, p5

    move-object/from16 v1, p30

    iput v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mSyncInterval:I

    .line 208
    :cond_31
    const/16 p0, -0x64

    if-eq p0, p6, :cond_3a

    .line 209
    move v0, p6

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mIsDefault:B

    .line 210
    :cond_3a
    if-eqz p7, :cond_41

    .line 211
    move-object v0, p7

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mSenderName:Ljava/lang/String;

    .line 212
    :cond_41
    if-eqz p8, :cond_48

    .line 213
    move-object v0, p8

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mProtocolVersion:Ljava/lang/String;

    .line 214
    :cond_48
    if-eqz p9, :cond_4f

    .line 215
    move-object v0, p9

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mSignature:Ljava/lang/String;

    .line 216
    :cond_4f
    const/16 p0, -0x64

    if-eq p0, p11, :cond_61

    .line 217
    move v0, p11

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mEmailNotificationVibrateWhenSilent:B

    .line 218
    const/4 p0, 0x1

    if-ne p0, p11, :cond_61

    .line 219
    const/4 p0, 0x0

    move v0, p0

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mEmailNotificationVibrateAlways:B

    .line 221
    :cond_61
    const/16 p0, -0x64

    if-eq p0, p10, :cond_73

    .line 222
    const/4 p0, 0x1

    if-ne p0, p10, :cond_6e

    .line 223
    const/4 p0, 0x0

    move v0, p0

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mEmailNotificationVibrateWhenSilent:B

    .line 224
    :cond_6e
    move v0, p10

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mEmailNotificationVibrateAlways:B

    .line 228
    :cond_73
    if-eqz p12, :cond_7a

    .line 229
    move-object v0, p12

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingProtocol:Ljava/lang/String;

    .line 230
    :cond_7a
    if-eqz p13, :cond_82

    .line 231
    move-object/from16 v0, p13

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerAddress:Ljava/lang/String;

    .line 232
    :cond_82
    const/16 p0, -0x64

    move v0, p0

    move/from16 v1, p14

    if-eq v0, v1, :cond_8f

    .line 233
    move/from16 v0, p14

    move-object/from16 v1, p30

    iput v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPort:I

    .line 235
    :cond_8f
    const/16 p0, -0x64

    move v0, p0

    move/from16 v1, p15

    if-eq v0, v1, :cond_a8

    .line 236
    move/from16 v0, p15

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseSSL:B

    .line 237
    const/4 p0, 0x1

    move v0, p0

    move/from16 v1, p15

    if-ne v0, v1, :cond_a8

    .line 238
    const/4 p0, 0x0

    move v0, p0

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseTLS:B

    .line 240
    :cond_a8
    const/16 p0, -0x64

    move v0, p0

    move/from16 v1, p16

    if-eq v0, v1, :cond_c1

    .line 241
    move/from16 v0, p16

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseTLS:B

    .line 242
    const/4 p0, 0x1

    move v0, p0

    move/from16 v1, p16

    if-ne v0, v1, :cond_c1

    .line 243
    const/4 p0, 0x0

    move v0, p0

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseSSL:B

    .line 245
    :cond_c1
    const/16 p0, -0x64

    move v0, p0

    move/from16 v1, p17

    if-eq v0, v1, :cond_ce

    .line 246
    move/from16 v0, p17

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerAcceptAllCertificates:B

    .line 248
    :cond_ce
    move-object/from16 v0, p30

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseSSL:B

    move p0, v0

    if-nez p0, :cond_e2

    move-object/from16 v0, p30

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseTLS:B

    move p0, v0

    if-nez p0, :cond_e2

    .line 249
    const/4 p0, 0x0

    move v0, p0

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerAcceptAllCertificates:B

    .line 252
    :cond_e2
    if-eqz p18, :cond_ea

    .line 253
    move-object/from16 v0, p18

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerLogin:Ljava/lang/String;

    .line 254
    :cond_ea
    if-eqz p19, :cond_f2

    .line 255
    move-object/from16 v0, p19

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPassword:Ljava/lang/String;

    .line 256
    :cond_f2
    if-eqz p20, :cond_fa

    .line 257
    move-object/from16 v0, p20

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPathPrefix:Ljava/lang/String;

    .line 259
    :cond_fa
    if-eqz p21, :cond_102

    .line 260
    move-object/from16 v0, p21

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingProtocol:Ljava/lang/String;

    .line 261
    :cond_102
    if-eqz p22, :cond_10a

    .line 262
    move-object/from16 v0, p22

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerAddress:Ljava/lang/String;

    .line 263
    :cond_10a
    const/16 p0, -0x64

    move v0, p0

    move/from16 v1, p23

    if-eq v0, v1, :cond_117

    .line 264
    move/from16 v0, p23

    move-object/from16 v1, p30

    iput v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPort:I

    .line 266
    :cond_117
    const/16 p0, -0x64

    move v0, p0

    move/from16 v1, p24

    if-eq v0, v1, :cond_130

    .line 267
    move/from16 v0, p24

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseSSL:B

    .line 268
    const/4 p0, 0x1

    move v0, p0

    move/from16 v1, p24

    if-ne v0, v1, :cond_130

    .line 269
    const/4 p0, 0x0

    move v0, p0

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseTLS:B

    .line 271
    :cond_130
    const/16 p0, -0x64

    move v0, p0

    move/from16 v1, p25

    if-eq v0, v1, :cond_149

    .line 272
    move/from16 v0, p25

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseTLS:B

    .line 273
    const/4 p0, 0x1

    move v0, p0

    move/from16 v1, p25

    if-ne v0, v1, :cond_149

    .line 274
    const/4 p0, 0x0

    move v0, p0

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseSSL:B

    .line 276
    :cond_149
    const/16 p0, -0x64

    move v0, p0

    move/from16 v1, p26

    if-eq v0, v1, :cond_156

    .line 277
    move/from16 v0, p26

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerAcceptAllCertificates:B

    .line 279
    :cond_156
    move-object/from16 v0, p30

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseSSL:B

    move p0, v0

    if-nez p0, :cond_16a

    move-object/from16 v0, p30

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseTLS:B

    move p0, v0

    if-nez p0, :cond_16a

    .line 280
    const/4 p0, 0x0

    move v0, p0

    move-object/from16 v1, p30

    iput-byte v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerAcceptAllCertificates:B

    .line 283
    :cond_16a
    if-eqz p27, :cond_172

    .line 284
    move-object/from16 v0, p27

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerLogin:Ljava/lang/String;

    .line 285
    :cond_172
    if-eqz p28, :cond_17a

    .line 286
    move-object/from16 v0, p28

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPassword:Ljava/lang/String;

    .line 287
    :cond_17a
    if-eqz p29, :cond_182

    .line 288
    move-object/from16 v0, p29

    move-object/from16 v1, p30

    iput-object v0, v1, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPathPrefix:Ljava/lang/String;
    :try_end_182
    .catchall {:try_start_5 .. :try_end_182} :catchall_184

    .line 289
    :cond_182
    monitor-exit v2

    return-void

    .line 196
    :catchall_184
    move-exception p0

    monitor-exit v2

    throw p0
.end method

.method public static declared-synchronized sendAccountsChangedBroadcast(Landroid/content/Context;)V
    .registers 10
    .parameter "mContext"

    .prologue
    .line 57
    const-class v4, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v4

    :try_start_3
    const-string v2, "android.accounts.LOGIN_ACCOUNTS_CHANGED"

    .line 58
    .local v2, LOGIN_ACCOUNTS_CHANGED_ACTION:Ljava/lang/String;
    const/high16 v1, 0x1000

    .line 59
    .local v1, FLAG_RECEIVER_REGISTERED_ONLY_BEFORE_BOOT:I
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 60
    .local v0, ACCOUNTS_CHANGED_INTENT:Landroid/content/Intent;
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 61
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 63
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Lcom/android/server/enterprise/SettingsUtils;->HOST_AUTH_CONTENT_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    .line 64
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_37
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_28} :catch_31

    .line 68
    .end local v0           #ACCOUNTS_CHANGED_INTENT:Landroid/content/Intent;
    .end local v1           #FLAG_RECEIVER_REGISTERED_ONLY_BEFORE_BOOT:I
    .end local v2           #LOGIN_ACCOUNTS_CHANGED_ACTION:Ljava/lang/String;
    :goto_28
    :try_start_28
    const-string v5, "SettingsUtils"

    const-string v6, "sendAccountsChangedBroadcast()"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2f
    .catchall {:try_start_28 .. :try_end_2f} :catchall_37

    .line 69
    monitor-exit v4

    return-void

    .line 65
    :catch_31
    move-exception v5

    move-object v3, v5

    .line 66
    .local v3, e:Ljava/lang/Exception;
    :try_start_33
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_37

    goto :goto_28

    .line 57
    .end local v3           #e:Ljava/lang/Exception;
    :catchall_37
    move-exception v5

    monitor-exit v4

    throw v5
.end method

.method static declared-synchronized setAsDefaultAccount(JLandroid/content/Context;)Z
    .registers 16
    .parameter "accountId"
    .parameter "mContext"

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    const-string v6, "isDefault"

    const-string v6, "SettingsUtils"

    .line 32
    const-class v6, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter v6

    const/4 v2, 0x0

    .line 33
    .local v2, success:Z
    const-wide/16 v7, 0x1

    cmp-long v7, v7, p0

    if-lez v7, :cond_1a

    .line 34
    :try_start_10
    const-string v7, "SettingsUtils"

    const-string v8, "setAsDefaultAccount : accountId is invalid"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_17
    .catchall {:try_start_10 .. :try_end_17} :catchall_a1

    move v3, v2

    .line 52
    .end local v2           #success:Z
    .local v3, success:I
    :goto_18
    monitor-exit v6

    return v3

    .line 37
    .end local v3           #success:I
    .restart local v2       #success:Z
    :cond_1a
    :try_start_1a
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 38
    .local v4, values:Landroid/content/ContentValues;
    const-string v7, "isDefault"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_29
    .catchall {:try_start_1a .. :try_end_29} :catchall_a1

    .line 41
    :try_start_29
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    sget-object v8, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v7, v8, v4, v9, v10}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 42
    .local v0, count:I
    const-string v7, "SettingsUtils"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setAsDefaultAccount : row count for resetting the default column : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V
    :try_end_52
    .catchall {:try_start_29 .. :try_end_52} :catchall_a1
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_52} :catch_9a

    .line 44
    .end local v4           #values:Landroid/content/ContentValues;
    .local v5, values:Landroid/content/ContentValues;
    :try_start_52
    const-string v7, "isDefault"

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 45
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    sget-object v8, Lcom/android/server/enterprise/SettingsUtils;->ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "_id = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v7, v8, v5, v9, v10}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 46
    const-string v7, "SettingsUtils"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setAsDefaultAccount : row count for setting the default column : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_92
    .catchall {:try_start_52 .. :try_end_92} :catchall_a1
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_92} :catch_a4

    .line 47
    if-lez v0, :cond_98

    move v2, v12

    :goto_95
    move-object v4, v5

    .end local v0           #count:I
    .end local v5           #values:Landroid/content/ContentValues;
    .restart local v4       #values:Landroid/content/ContentValues;
    :goto_96
    move v3, v2

    .line 52
    .restart local v3       #success:I
    goto :goto_18

    .end local v3           #success:I
    .end local v4           #values:Landroid/content/ContentValues;
    .restart local v0       #count:I
    .restart local v5       #values:Landroid/content/ContentValues;
    :cond_98
    move v2, v11

    .line 47
    goto :goto_95

    .line 48
    .end local v0           #count:I
    .end local v5           #values:Landroid/content/ContentValues;
    .restart local v4       #values:Landroid/content/ContentValues;
    :catch_9a
    move-exception v7

    move-object v1, v7

    .line 49
    .local v1, e:Ljava/lang/Exception;
    :goto_9c
    const/4 v2, 0x0

    .line 50
    :try_start_9d
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_a0
    .catchall {:try_start_9d .. :try_end_a0} :catchall_a1

    goto :goto_96

    .line 32
    .end local v1           #e:Ljava/lang/Exception;
    .end local v4           #values:Landroid/content/ContentValues;
    :catchall_a1
    move-exception v7

    monitor-exit v6

    throw v7

    .line 48
    .restart local v0       #count:I
    .restart local v5       #values:Landroid/content/ContentValues;
    :catch_a4
    move-exception v7

    move-object v1, v7

    move-object v4, v5

    .end local v5           #values:Landroid/content/ContentValues;
    .restart local v4       #values:Landroid/content/ContentValues;
    goto :goto_9c
.end method

.method static declared-synchronized updateExistingAccount(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;BBLjava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLandroid/content/Context;)J
    .registers 103
    .parameter "accountId"
    .parameter "displayName"
    .parameter "emailAddress"
    .parameter "easUser"
    .parameter "easDomain"
    .parameter "syncLookback"
    .parameter "syncInterval"
    .parameter "isDefault"
    .parameter "senderName"
    .parameter "protocolVersion"
    .parameter "signature"
    .parameter "emailNotificationVibrateAlways"
    .parameter "emailNotificationVibrateWhenSilent"
    .parameter "inComingProtocol"
    .parameter "inComingServerAddress"
    .parameter "inComingServerPort"
    .parameter "inComingServerUseSSL"
    .parameter "inComingServerUseTLS"
    .parameter "inComingServerAcceptAllCertificates"
    .parameter "inComingServerLogin"
    .parameter "inComingServerPassword"
    .parameter "inComingServerPathPrefix"
    .parameter "outGoingProtocol"
    .parameter "outGoingServerAddress"
    .parameter "outGoingServerPort"
    .parameter "outGoingServerUseSSL"
    .parameter "outGoingServerUseTLS"
    .parameter "outGoingServerAcceptAllCertificates"
    .parameter "outGoingServerLogin"
    .parameter "outGoingServerPassword"
    .parameter "outGoingServerPathPrefix"
    .parameter "isEasAccount"
    .parameter "isUpdateOP"
    .parameter "mContext"

    .prologue
    .line 86
    const-class p33, Lcom/android/server/enterprise/SettingsUtils;

    monitor-enter p33

    .end local p33
    :try_start_3
    const-string v3, "SettingsUtils"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updateExistingAccount : Processing account updation request for AccountId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-wide/from16 v1, p0

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " (AccountType is : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz p32, :cond_45

    const-string v5, "Eas"

    :goto_21
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " )"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    const-wide/16 v3, -0x1

    .line 89
    .local v3, invalidAccId:J
    const-wide/16 v3, 0x1

    cmp-long v3, v3, p0

    if-lez v3, :cond_48

    .line 90
    .end local v3           #invalidAccId:J
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p1, "updateExistingAccount : accountId is invalid"

    invoke-static/range {p0 .. p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_41
    .catchall {:try_start_3 .. :try_end_41} :catchall_1ed

    .line 91
    const-wide/16 p0, -0x1

    .line 154
    :goto_43
    monitor-exit p33

    return-wide p0

    .line 86
    .restart local p0
    :cond_45
    :try_start_45
    const-string v5, "Non-Eas"

    goto :goto_21

    .line 95
    :cond_48
    const/4 v3, 0x1

    move v0, v3

    move/from16 v1, p12

    if-ne v0, v1, :cond_5e

    const/4 v3, 0x1

    move v0, v3

    move/from16 v1, p13

    if-ne v0, v1, :cond_5e

    .line 96
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p1, "updateExistingAccount : Error :: Invalid input parameters. From the arguments \'emailNotificationVibrateAlways\' and \'emailNotificationVibrateWhenSilent\' only one will be true at a time"

    invoke-static/range {p0 .. p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const-wide/16 p0, -0x1

    goto :goto_43

    .line 101
    .restart local p0
    :cond_5e
    const/4 v3, 0x1

    move v0, v3

    move/from16 v1, p17

    if-ne v0, v1, :cond_74

    const/4 v3, 0x1

    move v0, v3

    move/from16 v1, p18

    if-ne v0, v1, :cond_74

    .line 102
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p1, "updateExistingAccount : Error :: Invalid input parameters. From the arguments \'inComingServerUseSSL\' and \'inComingServerUseTLS\' only one will be true at a time"

    invoke-static/range {p0 .. p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    const-wide/16 p0, -0x1

    goto :goto_43

    .line 106
    .restart local p0
    :cond_74
    const/4 v3, 0x1

    move v0, v3

    move/from16 v1, p26

    if-ne v0, v1, :cond_8a

    const/4 v3, 0x1

    move v0, v3

    move/from16 v1, p27

    if-ne v0, v1, :cond_8a

    .line 107
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p1, "updateExistingAccount : Error :: Invalid input parameters. From the arguments \'outGoingServerUseSSL\' and \'outGoingServerUseTLS\' only one will be true at a time"

    invoke-static/range {p0 .. p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    const-wide/16 p0, -0x1

    goto :goto_43

    .line 111
    .restart local p0
    :cond_8a
    move-wide/from16 v0, p0

    move-object/from16 v2, p34

    invoke-static {v0, v1, v2}, Lcom/android/server/enterprise/SettingsUtils;->getAccountDetails(JLandroid/content/Context;)Landroid/app/enterprise/Account;

    move-result-object v66

    .line 112
    .local v66, ac:Landroid/app/enterprise/Account;
    if-nez v66, :cond_9e

    .line 113
    const-string p0, "SettingsUtils"

    .end local p0
    const-string p1, "updateExistingAccount : Account information is null"

    invoke-static/range {p0 .. p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    const-wide/16 p0, -0x1

    goto :goto_43

    .line 117
    .restart local p0
    :cond_9e
    invoke-static/range {p2 .. p2}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 118
    invoke-static/range {p3 .. p3}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 119
    invoke-static/range {p4 .. p4}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 120
    invoke-static/range {p5 .. p5}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    .line 121
    invoke-static/range {p9 .. p9}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p9

    .line 122
    invoke-static/range {p10 .. p10}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p10

    .line 123
    invoke-static/range {p11 .. p11}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p11

    .line 125
    invoke-static/range {p14 .. p14}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p14

    .line 126
    invoke-static/range {p15 .. p15}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p15

    .line 127
    invoke-static/range {p20 .. p20}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p20

    .line 128
    invoke-static/range {p21 .. p21}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p21

    .line 129
    invoke-static/range {p22 .. p22}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p22

    .line 131
    invoke-static/range {p23 .. p23}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p23

    .line 132
    invoke-static/range {p24 .. p24}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p24

    .line 133
    invoke-static/range {p29 .. p29}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p29

    .line 134
    invoke-static/range {p30 .. p30}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p30

    .line 135
    invoke-static/range {p31 .. p31}, Lcom/android/server/enterprise/SettingsUtils;->getValidStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p31

    .line 138
    new-instance v33, Lcom/android/server/enterprise/AccountMetaData;

    invoke-direct/range {v33 .. v33}, Lcom/android/server/enterprise/AccountMetaData;-><init>()V

    .line 139
    .local v33, accountMData:Lcom/android/server/enterprise/AccountMetaData;
    move-object/from16 v0, v66

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Lcom/android/server/enterprise/SettingsUtils;->fillExistingAccountInfo(Landroid/app/enterprise/Account;Lcom/android/server/enterprise/AccountMetaData;)V

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move/from16 v13, p12

    move/from16 v14, p13

    move-object/from16 v15, p14

    move-object/from16 v16, p15

    move/from16 v17, p16

    move/from16 v18, p17

    move/from16 v19, p18

    move/from16 v20, p19

    move-object/from16 v21, p20

    move-object/from16 v22, p21

    move-object/from16 v23, p22

    move-object/from16 v24, p23

    move-object/from16 v25, p24

    move/from16 v26, p25

    move/from16 v27, p26

    move/from16 v28, p27

    move/from16 v29, p28

    move-object/from16 v30, p29

    move-object/from16 v31, p30

    move-object/from16 v32, p31

    .line 142
    invoke-static/range {v3 .. v33}, Lcom/android/server/enterprise/SettingsUtils;->loadNewValuesInAccountMetaData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;BBLjava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/server/enterprise/AccountMetaData;)V

    .line 147
    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mDisplayName:Ljava/lang/String;

    move-object/from16 v34, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mEmailAddress:Ljava/lang/String;

    move-object/from16 v35, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mEasUser:Ljava/lang/String;

    move-object/from16 v36, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mEasDomain:Ljava/lang/String;

    move-object/from16 v37, v0

    move-object/from16 v0, v33

    iget v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mSyncLookback:I

    move/from16 v38, v0

    move-object/from16 v0, v33

    iget v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mSyncInterval:I

    move/from16 v39, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mIsDefault:B

    move/from16 v40, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mSenderName:Ljava/lang/String;

    move-object/from16 v41, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mProtocolVersion:Ljava/lang/String;

    move-object/from16 v42, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mSignature:Ljava/lang/String;

    move-object/from16 v43, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mEmailNotificationVibrateAlways:B

    move/from16 v44, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mEmailNotificationVibrateWhenSilent:B

    move/from16 v45, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingProtocol:Ljava/lang/String;

    move-object/from16 v46, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerAddress:Ljava/lang/String;

    move-object/from16 v47, v0

    move-object/from16 v0, v33

    iget v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPort:I

    move/from16 v48, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseSSL:B

    move/from16 v49, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerUseTLS:B

    move/from16 v50, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerAcceptAllCertificates:B

    move/from16 v51, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerLogin:Ljava/lang/String;

    move-object/from16 v52, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPassword:Ljava/lang/String;

    move-object/from16 v53, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mInComingServerPathPrefix:Ljava/lang/String;

    move-object/from16 v54, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingProtocol:Ljava/lang/String;

    move-object/from16 v55, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerAddress:Ljava/lang/String;

    move-object/from16 v56, v0

    move-object/from16 v0, v33

    iget v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPort:I

    move/from16 v57, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseSSL:B

    move/from16 v58, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerUseTLS:B

    move/from16 v59, v0

    move-object/from16 v0, v33

    iget-byte v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerAcceptAllCertificates:B

    move/from16 v60, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerLogin:Ljava/lang/String;

    move-object/from16 v61, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPassword:Ljava/lang/String;

    move-object/from16 v62, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/enterprise/AccountMetaData;->mOutGoingServerPathPrefix:Ljava/lang/String;

    move-object/from16 v63, v0

    const/16 v65, 0x0

    move/from16 v64, p32

    move-object/from16 v67, p34

    invoke-static/range {v34 .. v67}, Lcom/android/server/enterprise/SettingsUtils;->createNewAccount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;BBLjava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IBBBLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLandroid/app/enterprise/Account;Landroid/content/Context;)J
    :try_end_1ea
    .catchall {:try_start_45 .. :try_end_1ea} :catchall_1ed

    move-result-wide p0

    .line 154
    goto/16 :goto_43

    .line 86
    .end local v33           #accountMData:Lcom/android/server/enterprise/AccountMetaData;
    .end local v66           #ac:Landroid/app/enterprise/Account;
    .end local p0
    :catchall_1ed
    move-exception p0

    monitor-exit p33

    throw p0
.end method
