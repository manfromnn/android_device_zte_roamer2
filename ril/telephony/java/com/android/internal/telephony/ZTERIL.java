/*
 * Copyright (C) 2012-2013 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import android.content.Context;
import android.os.Message;
import android.os.Parcel;

/**
 * Backwards compatible RIL implementation for Qualcomm 4.2-MR1
 * radios. Android 4.3 added the CELL_INFO_LIST commands, displacing several
 * command ids already used in pre-4.3 RILs.
 * 
 * {@hide}
 */
public class ZTERIL extends RIL implements CommandsInterface {

    static final int RIL_REQUEST_GET_DATA_CALL_PROFILE = 111;
    static final int RIL_REQUEST_GET_DATA_SUBSCRIPTION = 115;
    static final int RIL_REQUEST_GET_UICC_SUBSCRIPTION = 114;
    static final int RIL_REQUEST_IMS_REGISTRATION_STATE = 109;
    static final int RIL_REQUEST_IMS_SEND_SMS = 110;
    static final int RIL_REQUEST_SET_DATA_SUBSCRIPTION = 113;
    static final int RIL_REQUEST_SET_SUBSCRIPTION_MODE = 116;
    static final int RIL_REQUEST_SET_UICC_SUBSCRIPTION = 112;
    static final int RIL_UNSOL_RESPONSE_IMS_NETWORK_STATE_CHANGED = 1036;
    static final int RIL_UNSOL_TETHERED_MODE_STATE_CHANGED = 1037;
    static final int RIL_REQUEST_GSM_BROADCAST_ACTIVATION = 91;
    static final int RIL_REQUEST_OPERATOR = 22;
    static final int RIL_REQUEST_QUERY_NETWORK_SELECTION_MODE = 45;
    static final int RIL_REQUEST_SET_NETWORK_SELECTION_AUTOMATIC = 46;
    static final int RIL_REQUEST_VOICE_REGISTRATION_STATE = 20;

    public ZTERIL(Context paramContext, int paramInt1,
           int paramInt2, Integer paramInteger) {
         super(paramContext, paramInt1, paramInt2, paramInteger);
    }
  
    public void getCellInfoList(Message paramMessage) {
        riljLog("[STUB] > getCellInfoList");
    }
  
    public void getDataCallProfile(int paramInt, Message paramMessage) {
    RILRequest localRILRequest = RILRequest.obtain(111, paramMessage);
    localRILRequest.mParcel.writeInt(1);
    localRILRequest.mParcel.writeInt(paramInt);
    riljLog(localRILRequest.serialString() + "> " + requestToString(localRILRequest.mRequest) + " : " + paramInt);
    send(localRILRequest);
  }
  
    public void getImsRegistrationState(Message paramMessage) {
    RILRequest localRILRequest = RILRequest.obtain(109, paramMessage);
    riljLog(localRILRequest.serialString() + "> " + requestToString(localRILRequest.mRequest));
    send(localRILRequest);
  }
  
    public void setCellInfoListRate(int paramInt, Message paramMessage) {
    riljLog("[STUB] > setCellInfoListRate");
  }
  
  public void setDataSubscription(Message paramMessage) {
    RILRequest localRILRequest = RILRequest.obtain(113, paramMessage);
    riljLog(localRILRequest.serialString() + "> " + requestToString(localRILRequest.mRequest));
    send(localRILRequest);
  }
  
  public void setUiccSubscription(int paramInt1, int paramInt2, int paramInt3, int paramInt4, Message paramMessage) {
    RILRequest localRILRequest = RILRequest.obtain(112, paramMessage);
    riljLog(localRILRequest.serialString() + "> " + requestToString(localRILRequest.mRequest) + " slot: " + paramInt1 + " appIndex: " + paramInt2 + " subId: " + paramInt3 + " subStatus: " + paramInt4);
    localRILRequest.mParcel.writeInt(paramInt1);
    localRILRequest.mParcel.writeInt(paramInt2);
    localRILRequest.mParcel.writeInt(paramInt3);
    localRILRequest.mParcel.writeInt(paramInt4);
    send(localRILRequest);
  }
}
