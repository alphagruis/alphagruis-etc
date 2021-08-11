<p align="center">
  <img width="128" height="128" src="alphagruis-etc.svg">
  <img width="128" height="128" src="alphagruis-etc-logo.svg">
</p>

# :small_orange_diamond: alphagruis's Miner for Ethereum Classic

**alphagruis**'s Miner for **Ethereum Classic**, is a high performance and rock solid miner. This miner was designed and implemented in C++, OpenCL and CUDA **from scratch** by the **alphagruis** team, a small group of skilled developers, for a huge cryptocurrency mining farm. Now, **alphagruis** can finally publish its wonderful miner. Official binaries are currently only available for the **Windows** platform.

Try it, we are sure you will never want to go back.

## Table of Contents

* [Mining Backends](#mining-backends)
* [Mining Fee](#mining-fee)
* [Mining Transparency](#mining-transparency)
* [Install](#install)
* [Configuration](#configuration)
  * [`"fStratumAddressArray"`](#configuration-fstratumaddressarray)
  * [`"fMinerSettingsArray"`](#configuration-fminersettingsarray)
  * [`"fDevicePCIeTopology"`](#configuration-fdevicepcietopology)
  * [`"fDeviceOverclockSettings"`](#configuration-fdeviceoverclocksettings)
  * [`"fKernelSettings"`](#configuration-fkernelsettings)
* [Usage](#usage)
  * [System Requirements](#system-requirements)
  * [Virtual Memory Size](#virtual-memory-size)
* [License](#license)

## Mining Backends

- **OpenCL** for AMD GPUs.
- **CUDA** for NVIDIA GPUs.

*The miner is able to run on hardware with AMD GPUs and NVIDIA GPUs at the same time.*

## Mining Fee

**alphagruis**'s Miner for **Ethereum Classic**, is not free. The mining fee time is 36 seconds every 60 minutes minus 36 seconds. In other words, the fee amounts to 1%. The miner unambiguously, display on the console when the mining fee is active.

## Mining Transparency

**alphagruis**'s Miner for **Ethereum Classic** is completely transparent (the binary (executable machine code) is signed and not packed). The hashrate reported by the miner is not inflated and will match, on average, to the effective hashrate calculated by the pool. Without any tricks. Everything the miner does is displayed on the console and written to the log file. Nothing is left out.

**alphagruis** encourages everyone to scan all files contained in this repository with their favorite antivirus.

## Install

Standalone executable for Windows is provided in the [Releases] section. Download the archive and unpack the content to a place accessible from command line.

## Configuration

To configure the miner, you can easily edit the default **alphagruis-etc.json** file in JSON format or, if you prefer, you can edit your own configuration file and specify its file path, as additional parameter, via the command line to run the executable. The choice to use a configuration file is essentially due to the number of customizable parameters, which are difficult to specify via the command line, without errors and without exceeding the same limits.

*All JSON field values can be filled with environment variables.*

ex. alphagruis.json file in JSON format to mine with the *ethermine* pool:

<details>
<summary>JSON Object</summary>
<p>

```json5
{
    // [optional]
    "fLogFile": 1,

    // [optional]
    "fColors": 1,

    // [required]
    "fWorker": "alphagruis",

    // [required]
    "fStratumAddressArray":
    [
        //
        // [ETC] ethermine, nonSSL: 4444, SSL strict: 5555
        //

        {
            // [required]
            "fStratumMode": 0,

            // [required]
            "fWallet": "0x0000000000000000000000000000000000000000",

            // [optional]
            "fPassword": "",

            // [required]
            "fSocketAddressName": "eu1-etc.ethermine.org",

            // [required]
            "fServerPort": 5555,

            // [optional]
            "fSSL": 2
        },

        {
            // [required]
            "fStratumMode": 0,

            // [required]
            "fWallet": "0x0000000000000000000000000000000000000000",

            // [optional]
            "fPassword": "",

            // [required]
            "fSocketAddressName": "us1-etc.ethermine.org",

            // [required]
            "fServerPort": 5555,

            // [optional]
            "fSSL": 2
        },

        {
            // [required]
            "fStratumMode": 0,

            // [required]
            "fWallet": "0x0000000000000000000000000000000000000000",

            // [optional]
            "fPassword": "",

            // [required]
            "fSocketAddressName": "us2-etc.ethermine.org",

            // [required]
            "fServerPort": 5555,

            // [optional]
            "fSSL": 2
        }
    ],

    // [required]
    "fMinerSettingsArray":
    [
        //
        // AMD
        //

        {
            // [required] OpenCL: 1
            "fPlatformType": 1,

            // [required] AMD: 1
            "fDeviceType": 1,

        /*
            // [optional]
            "fDevicePCIeTopology":
            {
                // [optional]
                "fDomain": 0,

                // [required]
                "fBus": 0,

                // [required]
                "fDevice": 0,

                // [required]
                "fFunction": 0
            },
        */

            // [optional]
            "fDeviceOverclockSettings":
            {
                // [optional] unit: percentage, expressed in RELATIVE value.
                "fPowerLimit": 0,

                // [optional] unit: celsius, expressed in ABSOLUTE value.
                "fTemperatureLimit": 70,

                // [optional] unit: [MHz, mV] or MHz, expressed in ABSOLUTE value.
                "fClockGraphics": [1150, 850],

                // [optional] unit: [MHz, mV] or MHz, expressed in ABSOLUTE value.
                "fClockMemory": [2050, 850],

                // [optional] unit: natural, AMD only.
                "fMemoryTimingLevel": 2,

                // [optional] unit: percentage, expressed in ABSOLUTE value.
                "fFanSpeed": 100
            },

            // [optional]
            "fKernelSettings":
            {
                // [optional] default: 2
                "fComputeDatasetChannels": 2,

                // [optional] default: 128
                "fComputeDatasetKernelLocalWorkSize": 128,

                // [optional] default: 262144
                "fComputeDatasetKernelGlobalWorkStep": 262144,

                // [optional] default: 2
                "fSearchChannels": 2,

                // [optional] default: 128
                "fEthashSearchKernelLocalWorkSize": 128,

                // [optional] default: 1048576
                "fEthashSearchKernelGlobalWorkSize": 1048576,

                // [optional] default: 8
                "fEthashThreadsPerHash": 8
            }
        },

        //
        // NVIDIA
        //

        {
            // [required] CUDA: 32
            "fPlatformType": 32,

            // [required] NVIDIA: 4
            "fDeviceType": 4,

        /*
            // [optional]
            "fDevicePCIeTopology":
            {
                // [optional]
                "fDomain": 0,

                // [required]
                "fBus": 0,

                // [required]
                "fDevice": 0,

                // [required]
                "fFunction": 0
            },
        */

            // [optional]
            "fDeviceOverclockSettings":
            {
                // [optional] unit: percentage, expressed in ABSOLUTE value.
                "fPowerLimit": 70,

                // [optional] unit: celsius, expressed in ABSOLUTE value.
                "fTemperatureLimit": 70,

                // [optional] unit: MHz, expressed in RELATIVE value.
                "fClockGraphics": 150,

                // [optional] unit: MHz, expressed in RELATIVE value.
                "fClockMemory": 500,

                // [optional] unit: percentage, expressed in ABSOLUTE value.
                "fFanSpeed": 100
            },

            // [optional]
            "fKernelSettings":
            {
                // [optional] default: 2
                "fComputeDatasetChannels": 2,

                // [optional] default: 128
                "fComputeDatasetKernelLocalWorkSize": 128,

                // [optional] default: 0, CUDA only.
                "fComputeDatasetKernelMinBlocksPerMultiprocessor": 0,

                // [optional] default: 262144
                "fComputeDatasetKernelGlobalWorkStep": 262144,

                // [optional] default: 2
                "fSearchChannels": 2,

                // [optional] default: 128
                "fEthashSearchKernelLocalWorkSize": 128,

                // [optional] default: 0, CUDA only.
                "fEthashSearchKernelMinBlocksPerMultiprocessor": 0,

                // [optional] default: 1048576
                "fEthashSearchKernelGlobalWorkSize": 1048576,

                // [optional] default: 4
                "fEthashThreadsPerHash": 4,

                // [optional] default: 0, CUDA only.
                "fMaximumAmountOfRegisters": 0
            }
        }
    ]
}
```

</p>
</details>

|JSON Field|Data Type|Description|Sample|
|----------|:-------:|-----------|------|
|`"fLogFile"`|Number|0 to disable logging to file.<br/>1 to enable logging to file.|1|
|`"fColors"`|Number|0 to disable color output on console.<br/>1 to enable color output on console.|1|
|`"fWorker"`|String|The name of your rig. It may only contain letters and numbers. Some pools also only allow up to a maximum of 8 characters.|"alphagruis"|
|`"fStratumAddressArray"`|Array|The array can contain one or more objects with the parameters necessary to connect to the pool. Objects should be specified in order of preemption, from highest to lowest. If connection to the pool is not possible, the miner tries to use the next object to connect to the pool. After 10 minutes, the miner attempts to reestablish the connection using the primary object. And so on.|See Configuration: [`"fStratumAddressArray"`](#configuration-fstratumaddressarray).|
|`"fMinerSettingsArray"`|Array|The array can contain one or more objects to select and configure an entire family of GPUs or a single GPU.|See Configuration: [`"fMinerSettingsArray"`](#configuration-fminersettingsarray).|

#### Configuration: "fStratumAddressArray"

`"fStratumAddressArray"` array, can contain one or more JSON objects as below:

<details>
<summary>JSON Object</summary>
<p>

```json5
{
    // [required]
    "fStratumMode": 0,

    // [required]
    "fWallet": "0x0000000000000000000000000000000000000000",

    // [optional]
    "fPassword": "",

    // [required]
    "fSocketAddressName": "eu1-etc.ethermine.org",

    // [required]
    "fServerPort": 5555,

    // [optional]
    "fSSL": 2
}
```

</p>
</details>

|JSON Field|Data Type|Description|Sample|
|----------|:-------:|-----------|------|
|`"fStratumMode"`|Number|The stratum mode supported by pool.<br/>0 to use the mining proxy protocol (the most widely supported by Ethereum and Ethereum Classic mining pools).<br/>1 to use the plain stratum protocol (the most widely supported by Ravencoin mining pools).<br/>2 to use the ethereum stratum protocol (NiceHash).|0|
|`"fWallet"`|String|The address of the wallet associated with the connection.|"0x0000000000000000000000000000000000000000"|
|`"fPassword"`|String|The password, only if required, to connect to the pool. Otherwise, leave it empty.|""|
|`"fSocketAddressName"`|String|The mining server address of the pool.|"eu1-etc.ethermine.org"|
|`"fServerPort"`|Number|The mining server port of the pool.|5555|
|`"fSSL"`|Number|0 if `"fServerPort"` refers to an insecure connection (not recommended).<br/>1 if `"fServerPort"` refers to a secure connection (without Certificate Validation, to connect to the server which is using a self-signed certificate).<br/>2 if `"fServerPort"` refers to a secure connection (with Certificate Validation, to connect to the server which is using a CA-signed certificate).|2|

If possible, connect to your favorite mining pool using a secure connection (when available).

#### Configuration: "fMinerSettingsArray"

`"fMinerSettingsArray"` array, can contain one or more JSON objects as below:

<details>
<summary>JSON Object</summary>
<p>

```json5
{
    // [required] OpenCL: 1
    "fPlatformType": 1,

    // [required] AMD: 1
    "fDeviceType": 1,

/*
    // [optional]
    "fDevicePCIeTopology":
    {
        // [optional]
        "fDomain": 0,

        // [required]
        "fBus": 0,

        // [required]
        "fDevice": 0,

        // [required]
        "fFunction": 0
    },
*/

    // [optional]
    "fDeviceOverclockSettings":
    {
        // [optional] unit: percentage, expressed in RELATIVE value.
        "fPowerLimit": 0,

        // [optional] unit: celsius, expressed in ABSOLUTE value.
        "fTemperatureLimit": 70,

        // [optional] unit: [MHz, mV] or MHz, expressed in ABSOLUTE value.
        "fClockGraphics": [1150, 850],

        // [optional] unit: [MHz, mV] or MHz, expressed in ABSOLUTE value.
        "fClockMemory": [2050, 850],

        // [optional] unit: natural, AMD only.
        "fMemoryTimingLevel": 2,

        // [optional] unit: percentage, expressed in ABSOLUTE value.
        "fFanSpeed": 100
    },

    // [optional]
    "fKernelSettings":
    {
        // [optional] default: 2
        "fComputeDatasetChannels": 2,

        // [optional] default: 128
        "fComputeDatasetKernelLocalWorkSize": 128,

        // [optional] default: 262144
        "fComputeDatasetKernelGlobalWorkStep": 262144,

        // [optional] default: 2
        "fSearchChannels": 2,

        // [optional] default: 128
        "fEthashSearchKernelLocalWorkSize": 128,

        // [optional] default: 1048576
        "fEthashSearchKernelGlobalWorkSize": 1048576,

        // [optional] default: 8
        "fEthashThreadsPerHash": 8
    }
}
```

</p>
</details>

|JSON Field|Data Type|Description|Sample|
|----------|:-------:|-----------|------|
|`"fPlatformType"`|Number|0 to disable this item.<br/>1 to enable and configure the OpenCL backend (likely when `"fDeviceType"` is equal to 1, namely AMD).<br/>32 to enable and configure the CUDA backend (likely when `"fDeviceType"` is equal to 4, namely NVIDIA).|1|
|`"fDeviceType"`|Number|1 to enable the platform `"fPlatformType"` to use AMD GPUs.<br/>4 to enable the platform `"fPlatformType"` to use NVIDIA GPUs.|1|
|`"fDevicePCIeTopology"`|Object|This object is optional and is used to configure one and only one GPU. This option is useful if your hardware is made up of different GPUs, each requiring an ad hoc customization.|See Configuration: [`"fDevicePCIeTopology"`](#configuration-fdevicepcietopology).|
|`"fDeviceOverclockSettings"`|Object|Overclock settings, to be applied to all GPUs identified with the combination `"fPlatformType"`, `"fDeviceType"` and optionally also with `"fDevicePCIeTopology"`.|See Configuration: [`"fDeviceOverclockSettings"`](#configuration-fdeviceoverclocksettings).|
|`"fKernelSettings"`|Object|Kernel settings, to be applied to all GPUs identified with the combination `"fPlatformType"`, `"fDeviceType"` and optionally also with `"fDevicePCIeTopology"`.|See Configuration: [`"fKernelSettings"`](#configuration-fkernelsettings).|

Simplifying:
- To use AMD GPUs, the `"fMinerSettingsArray"` array must contain an object with `"fPlatformType"` equal to 1 and `"fDeviceType"` equal to 1.
- To use NVIDIA GPUs, the `"fMinerSettingsArray"` array must contain an object with `"fPlatformType"` equal to 32 and `"fDeviceType"` equal to 4.
- To use AMD and NVIDIA together, the `"fMinerSettingsArray"` array must contain two objects, one for AMD and one for NVIDIA. 
- To configure *n* GPUs individually, add *n* objects to `"fMinerSettingsArray"` array, declaring the `"fDevicePCIeTopology"` object to uniquely specify a single GPU.

> If your hardware (single motherboard), for example, consists of 5 AMD Radeon RX 580, 1 AMD Radeon RX 6900 XT, 5 NVIDIA GTX 1070 and 1 NVIDIA RTX 3070, to configure the 4 types of GPU it will be necessary to add to `"fMinerSettingsArray"` array, 4 objects: 
>
> 1. an object to configure 5 AMD Radeon RX 580 (without `"fDevicePCIeTopology"` object).
> 2. an object to work with 1 AMD Radeon RX 6900 XT (with `"fDevicePCIeTopology"` object).
> 3. an object to configure 5 NVIDIA GTX 1070 (without `"fDevicePCIeTopology"` object).
> 4. an object to work with 1 NVIDIA RTX 3070 (with `"fDevicePCIeTopology"` object).

Easier done than said.

#### Configuration: "fDevicePCIeTopology"

This object can optionally be declared in the object added to `"fMinerSettingsArray"`, to uniquely specify a single GPU.

<details>
<summary>JSON Object</summary>
<p>

```json5
{
    // [optional]
    "fDomain": 0,

    // [required]
    "fBus": 0,

    // [required]
    "fDevice": 0,

    // [required]
    "fFunction": 0
}
```

</p>
</details>

|JSON Field|Data Type|Description|Sample|
|----------|:-------:|-----------|------|
|`"fDomain"`|Number|PCI domain (always 0 on Windows).|0|
|`"fBus"`|Number|PCI bus number.|0|
|`"fDevice"`|Number|PCI device number.|0|
|`"fFunction"`|Number|PCI function number.|0|

*PCI Addressing.*

*Each PCI peripheral is identified by a **bus** number, a **device** number, and a **function** number. The PCI specification permits a single system to host up to 256 buses, but because 256 buses are not sufficient for many large systems, Linux now supports PCI domains. Each PCI **domain** can host up to 256 buses. Each bus hosts up to 32 devices, and each device can be a multifunction board (such as an audio device with an accompanying CD-ROM drive) with a maximum of eight functions.*

*On the Windows platform using the Task Manager application, you can easily see each GPU's PCIe values.*

#### Configuration: "fDeviceOverclockSettings"

This object can optionally be declared in the object added to `"fMinerSettingsArray"`, to handle overclocking.

![alt text](https://img.shields.io/badge/AMD_GPU_Overclock_Settings-red?color=ed1c24)

<details>
<summary>JSON Object</summary>
<p>

```json5
{
    // [optional] unit: percentage, expressed in RELATIVE value.
    "fPowerLimit": 0,
    
    // [optional] unit: celsius, expressed in ABSOLUTE value.
    "fTemperatureLimit": 70,
    
    // [optional] unit: [MHz, mV] or MHz, expressed in ABSOLUTE value.
    "fClockGraphics": [1150, 850],
    
    // [optional] unit: [MHz, mV] or MHz, expressed in ABSOLUTE value.
    "fClockMemory": [2050, 850],
    
    // [optional] unit: natural, AMD only.
    "fMemoryTimingLevel": 2,
    
    // [optional] unit: percentage, expressed in ABSOLUTE value.
    "fFanSpeed": 100
}
```

</p>
</details>

|JSON Field|Data Type|Description|Sample|
|----------|:-------:|-----------|------|
|`"fPowerLimit"`|Number|unit: percentage, expressed in **RELATIVE** value.|0|
|`"fTemperatureLimit"`|Number|unit: celsius, expressed in **ABSOLUTE** value (this parameter is obsolete and recent AMD drivers, no longer seem to contemplate it).|70|
|`"fClockGraphics"`|Array or Number|unit: [MHz, mV] or MHz, expressed in **ABSOLUTE** value.|[1150, 850] or 1150|
|`"fClockMemory"`|Array or Number|unit: [MHz, mV] or MHz, expressed in **ABSOLUTE** value (latest AMD GPUs, do not include voltage control for the memory).|[2050, 850] or 2050|
|`"fMemoryTimingLevel"`|Number|unit: natural, AMD only.|2|
|`"fFanSpeed"`|Number|unit: percentage, expressed in **ABSOLUTE** value.|100|

**The miner overclock the AMD GPUs via AMD Display Library (ADL) SDK using AMD OverdriveN API (version 7) and AMD Overdrive 8 API (version 8). Overdrive versions earlier than version 7 are not supported.**

for more information:<br/>
https://gpuopen.com/adl/

*If you don't know the overclocking values, before launching the miner, temporarily comment out the whole object (multi-line comments start with `/*` and ends with `*/`). Launch the miner. While mining, use of AMD's Radeon WattMan utility to tune your GPU. Once you have determined a stable configuration, uncomment the the whole object and fill in the overclocking values with your optimal overclocking values. Restart the miner for the settings to take effect.*

*Overclocking is automatically applied to all GPUs by the miner, always and only at startup. Since WattMan tends to reset the values when switching to manual tuning mode, remember to switch to manual mode on the GPU you want to control, before starting the miner. If you don't want the miner to handle overclocking, just comment out the whole object.*

![alt text](https://img.shields.io/badge/NVIDIA_GPU_Overclock_Settings-green?color=76b900)

<details>
<summary>JSON Object</summary>
<p>

```json5
{
    // [optional] unit: percentage, expressed in ABSOLUTE value.
    "fPowerLimit": 70,
    
    // [optional] unit: celsius, expressed in ABSOLUTE value.
    "fTemperatureLimit": 70,
    
    // [optional] unit: MHz, expressed in RELATIVE value.
    "fClockGraphics": 150,
    
    // [optional] unit: MHz, expressed in RELATIVE value.
    "fClockMemory": 450,
    
    // [optional] unit: percentage, expressed in ABSOLUTE value.
    "fFanSpeed": 100
}
```

</p>
</details>

|JSON Field|Data Type|Description|Sample|
|----------|:-------:|-----------|------|
|`"fPowerLimit"`|Number|unit: percentage, expressed in **ABSOLUTE** value.|70|
|`"fTemperatureLimit"`|Number|unit: celsius, expressed in **ABSOLUTE** value.|70|
|`"fClockGraphics"`|Number|unit: MHz, expressed in **RELATIVE** value.|150|
|`"fClockMemory"`|Number|unit: MHz, expressed in **RELATIVE** value.|450|
|`"fFanSpeed"`|Number|unit: percentage, expressed in **ABSOLUTE** value.|100|

**The miner overclok the NVIDIA GPUs via NVIDIA NVAPI and NVIDIA NVML API.**

for more information:<br/>
https://developer.nvidia.com/nvapi<br/>
https://docs.nvidia.com/deploy/nvml-api/index.html

*If you don't know the overclocking values, before starting the miner, play with the overclocking values of this object, incrementing them carefully and in small steps, starting from 0. Restart the miner for the settings to take effect.*

*Overclocking is automatically applied to all GPUs by the miner, always and only at startup. If you don't want the miner to handle overclocking, just comment out the whole object.*

#### Configuration: "fKernelSettings"

This object is optionally declared in the object added to `"fMinerSettingsArray"`, to set the optimal values to use for mining engines (kernels). The miner invokes two kernels: `ComputeDatasetKernel` kernel to compute the current epoch dataset (DAG), `EthashSearchKernel` kernel to compute the hashes. To improve the hashrate, focus on tweaking the parameters of this kernel.

<details>
<summary>JSON Object</summary>
<p>

```json5
{
    // [optional] default: 2
    "fComputeDatasetChannels": 2,

    // [optional] default: 128
    "fComputeDatasetKernelLocalWorkSize": 128,

    // [optional] default: 0, CUDA only.
    "fComputeDatasetKernelMinBlocksPerMultiprocessor": 0,
  
    // [optional] default: 262144
    "fComputeDatasetKernelGlobalWorkStep": 262144,

    // [optional] default: 2
    "fSearchChannels": 2,

    // [optional] default: 128
    "fEthashSearchKernelLocalWorkSize": 128,

    // [optional] default: 0, CUDA only.
    "fEthashSearchKernelMinBlocksPerMultiprocessor": 0,

    // [optional] default: 1048576
    "fEthashSearchKernelGlobalWorkSize": 1048576,

    // [optional] default: 4
    "fEthashThreadsPerHash": 4,

    // [optional] default: 0, CUDA only.
    "fMaximumAmountOfRegisters": 0
}
```

</p>
</details>

|JSON Field|Data Type|Description|Sample|
|----------|:-------:|-----------|------|
|`"fComputeDatasetChannels"`|Number|Number of channels (command queues in OpenCL, streams in CUDA) to be used to compute the dataset (commonly also known as DAG, acronym for Directed Acyclic Graph).<br/><br/>Integer value, multiple of 1, between 1 and 8.|2|
|`"fComputeDatasetKernelLocalWorkSize"`|Number|The size of the work-group (OpenCL), the size of thread block (CUDA).<br/><br/>Integer value, multiple of 32, between 32 and 4096.|128|
|`"fComputeDatasetKernelMinBlocksPerMultiprocessor"`|Number|This value is optionally used as a parameter by the `__launch_bounds__()` qualifier in the definition of a `__global__` function, CUDA only.|0|
|`"fComputeDatasetKernelGlobalWorkStep"`|Number|Number of dataset items to compute with a kernel execution command, queued on a channel.<br/><br/>Integer value, multiple of 1024, between 1024 and (1024 * 1024).|262144|
|`"fSearchChannels"`|Number|Number of channels (command queues in OpenCL, streams in CUDA) to be used to compute hashes.<br/><br/>Integer value, multiple of 1, between 1 and 8.|2|
|`"fEthashSearchKernelLocalWorkSize"`|Number|The size of the work-group (OpenCL), the size of thread block (CUDA).<br/><br/>Integer value, multiple of 32, between 32 and 4096.<br/><br/>**:small_red_triangle: This parameter directly affects the hashrate. When setting up your GPU, always look for the best value between 64, 128, 192, 256.**|128|
|`"fEthashSearchKernelMinBlocksPerMultiprocessor"`|Number|This value is optionally used as a parameter by the `__launch_bounds__()` qualifier in the definition of a `__global__` function, CUDA only.|0|
|`"fEthashSearchKernelGlobalWorkSize"`|Number|Number of hashes to compute with a kernel execution command, queued on a channel.<br/><br/>Integer value, multiple of 1024, between 1024 and (1024 * 1024 * 1024).|1048576|
|`"fEthashThreadsPerHash"`|Number|Number of work-items (OpenCL), number of threads (CUDA) to compute a single hash in parallel.<br/><br/>Integer value: { 1, 2, 4, 8 }.<br/><br/>**:small_red_triangle: This parameter directly affects the hashrate. When setting up your GPU, always look for the best value between 4 and 8.**|4|
|`"fMaximumAmountOfRegisters"`|Number|Maximum number of registers that a thread may use, CUDA only.|0|

*Adjust the **global work size** parameters with caution, based on the capabilities of your GPU:*

- *the number of **work-groups** used to launch the kernel is equal to global work size divided by local work size. In other words, the kernel execution is invoked with `number of work-groups` * `work-items per work-group` **work-items** (OpenCL).*

- *the number of **thread blocks** used to launch the kernel is equal to global work size divided by local work size. In other words, the kernel execution is invoked with `number of thread blocks` * `threads per thread block` **threads** (CUDA).*

All kernel settings are automatically adjusted and validated by the miner if needed.

**OpenCL, attribute of the kernels**

The `ComputeDatasetKernel` kernel is compiled at runtime with the OpenCL backend of the driver, using the following attribute:

```OpenCL
#ifndef _M_ComputeDatasetKernelLocalWorkSizeAttribute
#define _M_ComputeDatasetKernelLocalWorkSizeAttribute __attribute__ ((reqd_work_group_size (kComputeDatasetKernelLocalWorkSize, 1, 1)))
#endif
```

The `EthashSearchKernel` kernel is compiled at runtime with the OpenCL backend of the driver, using the following attribute:

```OpenCL
#ifndef _M_EthashSearchKernelLocalWorkSizeAttribute
#define _M_EthashSearchKernelLocalWorkSizeAttribute __attribute__ ((reqd_work_group_size (kEthashSearchKernelLocalWorkSize, 1, 1)))
#endif
```

> Basically, to maximize device utilization, you can choose to indirectly set the maximum number of registers per-kernel (using `"fEthashSearchKernelLocalWorkSize"`) adjusting kernel launch configuration.

for more information:<br/>
https://www.khronos.org/registry/OpenCL/sdk/2.2/docs/man/html/optionalAttributeQualifiers.html<br/>
https://www.khronos.org/registry/OpenCL/sdk/2.2/docs/man/html/clEnqueueNDRangeKernel.html

**CUDA, attribute of the kernels**

The `ComputeDatasetKernel` kernel is compiled at runtime with the CUDA backend of the driver, via NVIDIA NVRTC using the following attribute:

```CUDA
#if (qMaximumAmountOfRegisters > 0)
    #ifndef _M_ComputeDatasetKernelLocalWorkSizeAttribute
    #define _M_ComputeDatasetKernelLocalWorkSizeAttribute
    #endif
#elif (kComputeDatasetKernelMinBlocksPerMultiprocessor > 0)
    #ifndef _M_ComputeDatasetKernelLocalWorkSizeAttribute
    #define _M_ComputeDatasetKernelLocalWorkSizeAttribute __launch_bounds__ (kComputeDatasetKernelLocalWorkSize, kComputeDatasetKernelMinBlocksPerMultiprocessor)
    #endif
#else
    #ifndef _M_ComputeDatasetKernelLocalWorkSizeAttribute
    #define _M_ComputeDatasetKernelLocalWorkSizeAttribute __launch_bounds__ (kComputeDatasetKernelLocalWorkSize)
    #endif
#endif
```

The `EthashSearchKernel` kernel is compiled at runtime with the CUDA backend of the driver, via NVIDIA NVRTC using the following attribute:

```CUDA
#if (qMaximumAmountOfRegisters > 0)
    #ifndef _M_EthashSearchKernelLocalWorkSizeAttribute
    #define _M_EthashSearchKernelLocalWorkSizeAttribute
    #endif
#elif (kEthashSearchKernelMinBlocksPerMultiprocessor > 0)
    #ifndef _M_EthashSearchKernelLocalWorkSizeAttribute
    #define _M_EthashSearchKernelLocalWorkSizeAttribute __launch_bounds__ (kEthashSearchKernelLocalWorkSize, kEthashSearchKernelMinBlocksPerMultiprocessor)
    #endif
#else
    #ifndef _M_EthashSearchKernelLocalWorkSizeAttribute
    #define _M_EthashSearchKernelLocalWorkSizeAttribute __launch_bounds__ (kEthashSearchKernelLocalWorkSize)
    #endif
#endif
```

> Basically, to maximize device utilization, you can choose to set the maximum number of registers per-thread (using `"fMaximumAmountOfRegisters"`) or per-kernel (using `"fEthashSearchKernelLocalWorkSize"` and optionally `"fEthashSearchKernelMinBlocksPerMultiprocessor"`) adjusting kernel launch configuration.

for more information:<br/>
https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html#execution-configuration-optimizations<br/>
https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html#register-pressure

## Usage
  
The **alphagruis**'s Miner for **Ethereum Classic** is a command line program. This means you launch it either from a Windows Command Prompt, or create shortcuts to predefined command lines using a Windows batch/cmd file. After setting up the configuration file, **alphagruis**'s Miner for **Ethereum Classic** is ready to go. 

to launch the miner using the default **alphagruis-etc.json** file, type:

```batch
alphagruis-etc.exe
```

to launch the miner using your custom **alphagruis-etc-custom.json** file (can have any name you like), type:

```batch
alphagruis-etc.exe alphagruis-etc-custom.json
```

To ensure that the miner restarts automatically (in the unfortunate event of a crash), **alphagruis** recommends launch it via Windows batch/cmd file (see alphagruis-etc.cmd and variants, to connect to your favorite mining pool).

```batch
alphagruis-etc.cmd
```

:small_red_triangle: Press **ctrl+c** to exit gracefully.

*Note:*
- *To overclock AMD GPUs, AMD drivers do not require the executable to run as Administrator.*
- *To overclock NVIDIA GPUs, NVIDIA drivers **require** the executable to run as Administrator.*

#### System Requirements

|Components|Minimum Requirements|
|:--------:|--------------------|
|CPU|Multicore Intel processor (with 64-bit support) or AMD Athlon 64 processor.|
|OS|Windows 10 (64-bit).|
|RAM|8 GiB.|
|GPU|One or more discrete GPUs (AMD or NVIDIA) with **more** than 4 GiB of VRAM (must be above the DAG size). For development, we use hardware up to 12 GPUs each, however, for easy maintenance, we recommend not to exceed 8 GPUs per rig.|
|Storage|256 GiB SSD.|

#### Virtual Memory Size

The virtual memory size must be adjusted upwards according to the current DAG size and the number of discrete GPUs that are installed on your hardware. There is only one imperative rule to respect. The virtual memory size must be equal to or greater than `number of discrete GPUs` * `DAG size` + `size for OS`. For example, if the current DAG size is 4 GiB (4 * 1024 * 1024 * 1024 byte) and you have 7 GPUs, for each GPU you must allocate **at least** 4 GiB of virtual memory plus **at least** 8 GiB for OS: 7 * 4 GiB + 8 GIB = 36 GiB.

**alphagruis** recommends keeping the operating system and the GPU drivers updated to the latest version.

## License

**alphagruis**'s Miner for **Ethereum Classic** is licensed under the terms of the [BSD 3-Clause License](LICENSE.txt). *alphagruis*, the *alphagruis logo* and the *alphagruis avatar picture* are trademarks of **alphagruis**. All other product names, trademarks or company names, not attributable to **alphagruis**, are used solely for identification and belong to their respective owners.

[Releases]: https://github.com/alphagruis/alphagruis-etc/releases

<details>
<summary>Sample log file (colorless, *.md file format does not support color).</summary>
<p>

```
Welcome to alphagruis's Miner for Ethereum Classic, v1.0.2, build: 2021.07.29 19:48:28.000.

PCIe: 00000000:01:00.0, GPU.01: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:02:00.0, GPU.02: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:03:00.0, GPU.03: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:04:00.0, GPU.04: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:05:00.0, GPU.05: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:06:00.0, GPU.06: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:09:00.0, GPU.07: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:0a:00.0, GPU.08: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:0c:00.0, GPU.09: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:0d:00.0, GPU.10: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:0e:00.0, GPU.11: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units
PCIe: 00000000:0f:00.0, GPU.12: NVIDIA CUDA 11.1, GeForce GTX 1070, 8.00 GiB, 15 compute units

--- thread ID: 0xe48, 2021.07.31 15:27:25.692, PCIe: 00000000:01:00.0, GPU.01 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:26.072, PCIe: 00000000:02:00.0, GPU.02 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:26.451, PCIe: 00000000:03:00.0, GPU.03 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:26.748, PCIe: 00000000:04:00.0, GPU.04 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:27.156, PCIe: 00000000:05:00.0, GPU.05 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:27.541, PCIe: 00000000:06:00.0, GPU.06 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:27.905, PCIe: 00000000:09:00.0, GPU.07 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:28.246, PCIe: 00000000:0a:00.0, GPU.08 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:28.568, PCIe: 00000000:0c:00.0, GPU.09 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:28.909, PCIe: 00000000:0d:00.0, GPU.10 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:29.183, PCIe: 00000000:0e:00.0, GPU.11 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:29.480, PCIe: 00000000:0f:00.0, GPU.12 fDeviceOverclockSettings:
fPowerLimit: min = 50%, max = 120%, default = 100%, set = 50%
fTemperatureLimit: min = 60°C, max = 92°C, default = 83°C, set = 70°C
fClockGraphics: min = -200 MHz, max = +1200 MHz, default = +0 MHz, set = +150 MHz
fClockMemory: min = -1000 MHz, max = +1000 MHz, default = +0 MHz, set = +500 MHz
fFanSpeed: min = 41%, max = 100%, default = 0%, set = 75%

--- thread ID: 0xe48, 2021.07.31 15:27:29.515
connecting to asia1-etc.ethermine.org:5555

--- thread ID: 0xe48, 2021.07.31 15:27:29.648
connected to asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:00:00.148)

<<< thread ID: 0x2a14, 2021.07.31 15:27:29.652, 0 ms
{"jsonrpc":"2.0","id":1,"method":"eth_submitLogin","params":["..."],"worker":"alphagruis"}

>>> thread ID: 0xebc, 2021.07.31 15:27:29.673, 20 ms (20 ms)
{"id":1,"jsonrpc":"2.0","result":true}

<<< thread ID: 0x8d8, 2021.07.31 15:27:29.673, 0 ms
{"jsonrpc":"2.0","id":14,"method":"eth_getWork","params":[]}

>>> thread ID: 0x2100, 2021.07.31 15:27:29.693, 20 ms
{"id":0,"jsonrpc":"2.0","result":["0x3e91be909d78ea9ed3a60a71fee6065a3ee06b46eb58b02ff4d5efb4d34f6f78","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbb"]}

--- thread ID: 0x2100, 2021.07.31 15:27:29.699
epoch = 220 (next epoch in 21797 blocks), share difficulty = 4 GH.

--- thread ID: 0x2100, 2021.07.31 15:27:29.745
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute cache...

--- thread ID: 0x1eb4, 2021.07.31 15:27:29.673, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:00:00.173)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1719 rpm, 51°C], 0.000000 MH/s (11.12 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1718 rpm, 51°C], 0.000000 MH/s (11.33 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1731 rpm, 58°C], 0.000000 MH/s (12.38 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1714 rpm, 50°C], 0.000000 MH/s (10.58 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1731 rpm, 54°C], 0.000000 MH/s (11.07 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1731 rpm, 54°C], 0.000000 MH/s (12.05 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1735 rpm, 51°C], 0.000000 MH/s (11.23 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1720 rpm, 52°C], 0.000000 MH/s (11.55 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1725 rpm, 58°C], 0.000000 MH/s (11.78 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1728 rpm, 57°C], 0.000000 MH/s (11.70 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1722 rpm, 53°C], 0.000000 MH/s (12.54 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:00:04.339, 0 ms], [fan = 75%, 1727 rpm, 57°C], 0.000000 MH/s (12.13 W) = 0.000000 MH/s (139.47 W)

<<< thread ID: 0x2324, 2021.07.31 15:27:29.765, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000000000000","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:27:29.787, 93 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

↓↓↓ thread ID: 0xee0, 2021.07.31 15:27:30.880
PCIe: 00000000:02:00.0, GPU.02: mining is suspended, waiting for work.

↓↓↓ thread ID: 0xf60, 2021.07.31 15:27:30.953
PCIe: 00000000:0a:00.0, GPU.08: mining is suspended, waiting for work.

↓↓↓ thread ID: 0x2aac, 2021.07.31 15:27:31.220
PCIe: 00000000:0f:00.0, GPU.12: mining is suspended, waiting for work.

↓↓↓ thread ID: 0x1ae8, 2021.07.31 15:27:31.225
PCIe: 00000000:0e:00.0, GPU.11: mining is suspended, waiting for work.

↓↓↓ thread ID: 0x20d8, 2021.07.31 15:27:31.230
PCIe: 00000000:04:00.0, GPU.04: mining is suspended, waiting for work.

↓↓↓ thread ID: 0x120c, 2021.07.31 15:27:31.235
PCIe: 00000000:06:00.0, GPU.06: mining is suspended, waiting for work.

↓↓↓ thread ID: 0x2b98, 2021.07.31 15:27:31.240
PCIe: 00000000:09:00.0, GPU.07: mining is suspended, waiting for work.

↓↓↓ thread ID: 0x7d4, 2021.07.31 15:27:31.244
PCIe: 00000000:01:00.0, GPU.01: mining is suspended, waiting for work.

↓↓↓ thread ID: 0x1aa8, 2021.07.31 15:27:31.249
PCIe: 00000000:0c:00.0, GPU.09: mining is suspended, waiting for work.

↓↓↓ thread ID: 0x11d8, 2021.07.31 15:27:31.256
PCIe: 00000000:05:00.0, GPU.05: mining is suspended, waiting for work.

↓↓↓ thread ID: 0xa50, 2021.07.31 15:27:31.261
PCIe: 00000000:03:00.0, GPU.03: mining is suspended, waiting for work.

↓↓↓ thread ID: 0xd20, 2021.07.31 15:27:31.266
PCIe: 00000000:0d:00.0, GPU.10: mining is suspended, waiting for work.

--- thread ID: 0x2100, 2021.07.31 15:27:31.706, 1961 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute cache: done.

↑↑↑ thread ID: 0x11d8, 2021.07.31 15:27:31.706
PCIe: 00000000:05:00.0, GPU.05: mining is resumed.

↑↑↑ thread ID: 0x7d4, 2021.07.31 15:27:31.706
PCIe: 00000000:01:00.0, GPU.01: mining is resumed.

↑↑↑ thread ID: 0x2b98, 2021.07.31 15:27:31.706
PCIe: 00000000:09:00.0, GPU.07: mining is resumed.

↑↑↑ thread ID: 0x1aa8, 2021.07.31 15:27:31.706
PCIe: 00000000:0c:00.0, GPU.09: mining is resumed.

↑↑↑ thread ID: 0x120c, 2021.07.31 15:27:31.707
PCIe: 00000000:06:00.0, GPU.06: mining is resumed.

↑↑↑ thread ID: 0xd20, 2021.07.31 15:27:31.707
PCIe: 00000000:0d:00.0, GPU.10: mining is resumed.

↑↑↑ thread ID: 0x20d8, 2021.07.31 15:27:31.707
PCIe: 00000000:04:00.0, GPU.04: mining is resumed.

↑↑↑ thread ID: 0x1ae8, 2021.07.31 15:27:31.707
PCIe: 00000000:0e:00.0, GPU.11: mining is resumed.

↑↑↑ thread ID: 0xa50, 2021.07.31 15:27:31.707
PCIe: 00000000:03:00.0, GPU.03: mining is resumed.

↑↑↑ thread ID: 0xee0, 2021.07.31 15:27:31.707
PCIe: 00000000:02:00.0, GPU.02: mining is resumed.

↑↑↑ thread ID: 0x2aac, 2021.07.31 15:27:31.707
PCIe: 00000000:0f:00.0, GPU.12: mining is resumed.

↑↑↑ thread ID: 0xf60, 2021.07.31 15:27:31.707
PCIe: 00000000:0a:00.0, GPU.08: mining is resumed.

--- thread ID: 0x11d8, 2021.07.31 15:27:38.314
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:05:00.0, GPU.05 dataset...

--- thread ID: 0xee0, 2021.07.31 15:27:41.987
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:02:00.0, GPU.02 dataset...

--- thread ID: 0x2aac, 2021.07.31 15:27:41.990
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0f:00.0, GPU.12 dataset...

--- thread ID: 0x1aa8, 2021.07.31 15:27:43.160
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0c:00.0, GPU.09 dataset...

--- thread ID: 0x2b98, 2021.07.31 15:27:43.165
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:09:00.0, GPU.07 dataset...

--- thread ID: 0x7d4, 2021.07.31 15:27:43.167
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:01:00.0, GPU.01 dataset...

--- thread ID: 0xf60, 2021.07.31 15:27:43.173
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0a:00.0, GPU.08 dataset...

--- thread ID: 0xa50, 2021.07.31 15:27:43.177
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:03:00.0, GPU.03 dataset...

--- thread ID: 0xd20, 2021.07.31 15:27:43.177
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0d:00.0, GPU.10 dataset...

--- thread ID: 0x120c, 2021.07.31 15:27:43.178
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:06:00.0, GPU.06 dataset...

--- thread ID: 0x20d8, 2021.07.31 15:27:43.179
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:04:00.0, GPU.04 dataset...

--- thread ID: 0x1ae8, 2021.07.31 15:27:43.183
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0e:00.0, GPU.11 dataset...

--- thread ID: 0x1eb4, 2021.07.31 15:27:44.768, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:00:15.268)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434, 55 ms], [fan = 75%, 1696 rpm, 53°C], 0.000000 MH/s (108.86 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434, 26 ms], [fan = 75%, 1677 rpm, 54°C], 0.000000 MH/s (109.71 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434, 26 ms], [fan = 75%, 1673 rpm, 58°C], 0.000000 MH/s (111.11 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434, 24 ms], [fan = 75%, 1699 rpm, 52°C], 0.000000 MH/s (113.06 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434, 29 ms], [fan = 75%, 1699 rpm, 57°C], 0.000000 MH/s (109.51 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434,  0 ms], [fan = 75%, 1706 rpm, 55°C], 0.000000 MH/s (110.09 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434,  0 ms], [fan = 75%, 1701 rpm, 53°C], 0.000000 MH/s (108.34 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434,  0 ms], [fan = 75%, 1698 rpm, 52°C], 0.000000 MH/s (110.50 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434,  0 ms], [fan = 75%, 1676 rpm, 60°C], 0.000000 MH/s (108.97 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434,  0 ms], [fan = 75%, 1689 rpm, 59°C], 0.000000 MH/s (105.68 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434,  0 ms], [fan = 75%, 1713 rpm, 53°C], 0.000000 MH/s (111.13 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:00:19.434,  0 ms], [fan = 75%, 1696 rpm, 59°C], 0.000000 MH/s (108.98 W) = 0.000000 MH/s (1315.93 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:27:44.911, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000000000000","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:27:44.932, 15144 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x11d8, 2021.07.31 15:27:45.352, 7038 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:05:00.0, GPU.05 dataset: done.

--- thread ID: 0xee0, 2021.07.31 15:27:49.010, 7022 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:02:00.0, GPU.02 dataset: done.

--- thread ID: 0x2aac, 2021.07.31 15:27:49.151, 7160 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0f:00.0, GPU.12 dataset: done.

--- thread ID: 0x1aa8, 2021.07.31 15:27:50.199, 7038 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0c:00.0, GPU.09 dataset: done.

--- thread ID: 0x2b98, 2021.07.31 15:27:50.339, 7173 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:09:00.0, GPU.07 dataset: done.

--- thread ID: 0x7d4, 2021.07.31 15:27:50.419, 7251 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:01:00.0, GPU.01 dataset: done.

--- thread ID: 0xf60, 2021.07.31 15:27:50.537, 7364 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0a:00.0, GPU.08 dataset: done.

--- thread ID: 0xa50, 2021.07.31 15:27:50.678, 7501 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:03:00.0, GPU.03 dataset: done.

--- thread ID: 0xd20, 2021.07.31 15:27:50.816, 7638 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0d:00.0, GPU.10 dataset: done.

--- thread ID: 0x120c, 2021.07.31 15:27:50.946, 7767 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:06:00.0, GPU.06 dataset: done.

--- thread ID: 0x20d8, 2021.07.31 15:27:51.073, 7894 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:04:00.0, GPU.04 dataset: done.

--- thread ID: 0x1ae8, 2021.07.31 15:27:51.205, 8021 ms
epoch = 220, cache size = 45612608 (43.50 MiB), dataset size = 2919234688 (2.72 GiB), compute PCIe: 00000000:0e:00.0, GPU.11 dataset: done.

>>> thread ID: 0x1f8c, 2021.07.31 15:27:52.247, 7315 ms
{"id":0,"jsonrpc":"2.0","result":["0xc964ea2051cfa000bfc35fdc5828d430140de92a94784ad11b643476d0865c18","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbc"]}

--- thread ID: 0x1f8c, 2021.07.31 15:27:52.247
epoch = 220 (next epoch in 21796 blocks), share difficulty = 4 GH.

--- thread ID: 0x120c, 2021.07.31 15:27:54.453, PCIe: 00000000:06:00.0, GPU.06 share found (search channel 0).
 nonce: 0x498d028e0c9e3c7f
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000002e8cba92b7cc07e5448b04f32534d343244ebc8d1820dbdffe83a2f2
   mix: 0x11236825e51811cbce21e77ee7558478322934dad1b3fd6153e295295e63effc

<<< thread ID: 0x1140, 2021.07.31 15:27:54.453, 0 ms
{"jsonrpc":"2.0","id":1001,"method":"eth_submitWork","params":["0x498d028e0c9e3c7f","0xc964ea2051cfa000bfc35fdc5828d430140de92a94784ad11b643476d0865c18","0x11236825e51811cbce21e77ee7558478322934dad1b3fd6153e295295e63effc"],"worker":"alphagruis"}

--- thread ID: 0x182c, 2021.07.31 15:27:54.479, PCIe: 00000000:06:00.0, GPU.06 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:27:54.479, 2232 ms (26 ms)
{"id":1001,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:27:59.923, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:00:30.423)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589, 23 ms], [fan = 75%, 1724 rpm, 54°C], 30.578251 MH/s (110.28 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589, 50 ms], [fan = 75%, 1744 rpm, 55°C], 30.560219 MH/s (109.91 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589, 32 ms], [fan = 75%, 1711 rpm, 61°C], 30.433432 MH/s (108.74 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589,  0 ms], [fan = 75%, 1730 rpm, 54°C], 30.438001 MH/s (108.46 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589,  1 ms], [fan = 75%, 1725 rpm, 58°C], 30.564309 MH/s (110.54 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 1, S = 0, R = 0, I = 0], [00:00:05.470,  0 ms], [fan = 75%, 1737 rpm, 57°C], 30.431210 MH/s (109.59 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589,  0 ms], [fan = 75%, 1712 rpm, 54°C], 30.550542 MH/s (108.37 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589,  0 ms], [fan = 75%, 1731 rpm, 54°C], 30.553138 MH/s (110.00 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589,  0 ms], [fan = 75%, 1729 rpm, 62°C], 30.543761 MH/s (110.94 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589,  0 ms], [fan = 75%, 1714 rpm, 60°C], 30.410633 MH/s (110.47 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589,  0 ms], [fan = 75%, 1727 rpm, 55°C], 30.416483 MH/s (109.71 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:00:34.589,  0 ms], [fan = 75%, 1715 rpm, 60°C], 30.544755 MH/s (111.80 W) = 366.024734 MH/s (1318.82 W)

<<< thread ID: 0x8d8, 2021.07.31 15:28:00.078, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d1181e","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2324, 2021.07.31 15:28:00.109, 5629 ms (31 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:28:15.080, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:00:45.580)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746, 68 ms], [fan = 75%, 1713 rpm, 55°C], 30.582848 MH/s (108.65 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746, 15 ms], [fan = 75%, 1697 rpm, 56°C], 30.567111 MH/s (108.33 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746,  0 ms], [fan = 75%, 1732 rpm, 61°C], 30.551511 MH/s (109.93 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746, 25 ms], [fan = 75%, 1716 rpm, 55°C], 30.574426 MH/s (109.84 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746,  0 ms], [fan = 75%, 1730 rpm, 59°C], 30.568704 MH/s (110.56 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 1, S = 0, R = 0, I = 0], [00:00:20.627,  0 ms], [fan = 75%, 1728 rpm, 58°C], 30.557552 MH/s (110.44 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746,  0 ms], [fan = 75%, 1731 rpm, 55°C], 30.557807 MH/s (109.90 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746,  0 ms], [fan = 75%, 1723 rpm, 55°C], 30.549319 MH/s (110.33 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746,  0 ms], [fan = 75%, 1718 rpm, 62°C], 30.523311 MH/s (110.24 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746,  0 ms], [fan = 75%, 1725 rpm, 61°C], 30.523751 MH/s (108.23 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746,  0 ms], [fan = 75%, 1724 rpm, 56°C], 30.544887 MH/s (109.42 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:00:49.746,  0 ms], [fan = 75%, 1726 rpm, 61°C], 30.546682 MH/s (108.70 W) = 366.647909 MH/s (1314.56 W)

<<< thread ID: 0xe6c, 2021.07.31 15:28:15.266, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da9a65","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2100, 2021.07.31 15:28:15.292, 15182 ms (25 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xa50, 2021.07.31 15:28:15.908, PCIe: 00000000:03:00.0, GPU.03 share found (search channel 0).
 nonce: 0x498d028fe1a275d1
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000f32b9232ee2d663737f3fe6ce28fc013b82facc81b9cd51fcebd37b1
   mix: 0xcb9486b6abcbc6f94db9165e3d7bb24c76e13e4b2a84be1f553ced4f60de3437

<<< thread ID: 0x1fe0, 2021.07.31 15:28:15.908, 0 ms
{"jsonrpc":"2.0","id":1002,"method":"eth_submitWork","params":["0x498d028fe1a275d1","0xc964ea2051cfa000bfc35fdc5828d430140de92a94784ad11b643476d0865c18","0xcb9486b6abcbc6f94db9165e3d7bb24c76e13e4b2a84be1f553ced4f60de3437"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:28:15.932, PCIe: 00000000:03:00.0, GPU.03 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:28:15.932, 640 ms (24 ms)
{"id":1002,"jsonrpc":"2.0","result":true}

--- thread ID: 0xd20, 2021.07.31 15:28:19.164, PCIe: 00000000:0d:00.0, GPU.10 share found (search channel 0).
 nonce: 0x498d029028ddd6d2
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000248bc6e231af6bb6f3e97dd1200b15a3b2f54fc073d2028e28b2f8e4
   mix: 0x91edee707ee5017f2ef82f19dfd7b2dd740e6b5e8cf0b1a239090fa66a094130

<<< thread ID: 0x1f8c, 2021.07.31 15:28:19.165, 0 ms
{"jsonrpc":"2.0","id":1003,"method":"eth_submitWork","params":["0x498d029028ddd6d2","0xc964ea2051cfa000bfc35fdc5828d430140de92a94784ad11b643476d0865c18","0x91edee707ee5017f2ef82f19dfd7b2dd740e6b5e8cf0b1a239090fa66a094130"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:28:19.187, PCIe: 00000000:0d:00.0, GPU.10 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:28:19.187, 3254 ms (22 ms)
{"id":1003,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x182c, 2021.07.31 15:28:19.420, 233 ms
{"id":0,"jsonrpc":"2.0","result":["0xa45d5bf98ea67a0d1b6770fa38e8a4cbdf66f5d71ab9fc3b43cbf08fa52cea74","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbd"]}

--- thread ID: 0x182c, 2021.07.31 15:28:19.420
epoch = 220 (next epoch in 21795 blocks), share difficulty = 4 GH.

>>> thread ID: 0x8d8, 2021.07.31 15:28:19.461, 40 ms
{"id":0,"jsonrpc":"2.0","result":["0x7c8ebda073c1380546f282337e26de47b53d2f343b9cd952f15e17cff1c1c0d6","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbd"]}

--- thread ID: 0x8d8, 2021.07.31 15:28:19.461
epoch = 220 (next epoch in 21795 blocks), share difficulty = 4 GH.

--- thread ID: 0xee0, 2021.07.31 15:28:19.670, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 1).
 nonce: 0x498d029033b8074e
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000bd28e4d95f65c68dced8aa0067ad968923a33906b92f7dc376d0461c
   mix: 0xa2bacfc2e7f3e044b95e81f88ec846374356894575676534263c13fd572afea0

<<< thread ID: 0x2324, 2021.07.31 15:28:19.670, 0 ms
{"jsonrpc":"2.0","id":1004,"method":"eth_submitWork","params":["0x498d029033b8074e","0x7c8ebda073c1380546f282337e26de47b53d2f343b9cd952f15e17cff1c1c0d6","0xa2bacfc2e7f3e044b95e81f88ec846374356894575676534263c13fd572afea0"],"worker":"alphagruis"}

--- thread ID: 0xe6c, 2021.07.31 15:28:19.692, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0xe6c, 2021.07.31 15:28:19.692, 230 ms (22 ms)
{"id":1004,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2100, 2021.07.31 15:28:23.417, 3725 ms
{"id":0,"jsonrpc":"2.0","result":["0xae01d9827e7393c31e96f5a92509681876cb60cab34569b1f86a8452e61a38cb","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbd"]}

--- thread ID: 0x2100, 2021.07.31 15:28:23.417
epoch = 220 (next epoch in 21795 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1fe0, 2021.07.31 15:28:23.858, 440 ms
{"id":0,"jsonrpc":"2.0","result":["0xcb4459b84d73bdaabdb1d7361652708a14e359fc9de3ea7453bb472a877fb3f3","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbe"]}

--- thread ID: 0x1fe0, 2021.07.31 15:28:23.858
epoch = 220 (next epoch in 21794 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1e74, 2021.07.31 15:28:23.879, 21 ms
{"id":0,"jsonrpc":"2.0","result":["0x29fe65a39e2cea9cc9adc5b844f7dc67e32f3afb50cf3945333f095aeb163337","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbe"]}

--- thread ID: 0x1e74, 2021.07.31 15:28:23.879
epoch = 220 (next epoch in 21794 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1f8c, 2021.07.31 15:28:27.845, 3966 ms
{"id":0,"jsonrpc":"2.0","result":["0xc0a87dc4096e35963c66c67008c6423597d289f639089eb8f2bcb1d2e15631a8","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbe"]}

--- thread ID: 0x1f8c, 2021.07.31 15:28:27.846
epoch = 220 (next epoch in 21794 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:28:30.267, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:01:00.767)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:01:04.933,  3 ms], [fan = 75%, 1721 rpm, 56°C], 30.574665 MH/s (109.66 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 1, S = 0, R = 0, I = 0], [00:00:10.597, 13 ms], [fan = 75%, 1718 rpm, 57°C], 30.563255 MH/s (111.58 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 1, S = 0, R = 0, I = 0], [00:00:14.359,  0 ms], [fan = 75%, 1719 rpm, 62°C], 30.561007 MH/s (109.39 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 0, S = 0, R = 0, I = 0], [00:01:04.933,  0 ms], [fan = 75%, 1735 rpm, 56°C], 30.571710 MH/s (109.04 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:01:04.933,  0 ms], [fan = 75%, 1736 rpm, 59°C], 30.567081 MH/s (110.54 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 1, S = 0, R = 0, I = 0], [00:00:35.814,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.551641 MH/s (110.81 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:01:04.933,  0 ms], [fan = 75%, 1714 rpm, 56°C], 30.554478 MH/s (110.40 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 0, S = 0, R = 0, I = 0], [00:01:04.933,  0 ms], [fan = 75%, 1734 rpm, 56°C], 30.553091 MH/s (111.06 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:01:04.933,  0 ms], [fan = 75%, 1718 rpm, 63°C], 30.525214 MH/s (109.41 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 1, S = 0, R = 0, I = 0], [00:00:11.103,  0 ms], [fan = 75%, 1722 rpm, 62°C], 30.524882 MH/s (108.60 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 0, S = 0, R = 0, I = 0], [00:01:04.933,  0 ms], [fan = 75%, 1731 rpm, 57°C], 30.540233 MH/s (109.57 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:01:04.933,  0 ms], [fan = 75%, 1732 rpm, 61°C], 30.543513 MH/s (108.85 W) = 366.630770 MH/s (1318.91 W)

<<< thread ID: 0x1140, 2021.07.31 15:28:30.452, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da5772","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x182c, 2021.07.31 15:28:30.474, 2628 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x8d8, 2021.07.31 15:28:31.869, 1395 ms
{"id":0,"jsonrpc":"2.0","result":["0x57db2f39219571bea28e8c2d164f431693bbbf9ecc56a47988cc5afa8070e903","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbe"]}

--- thread ID: 0x8d8, 2021.07.31 15:28:31.869
epoch = 220 (next epoch in 21794 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2324, 2021.07.31 15:28:35.832, 3962 ms
{"id":0,"jsonrpc":"2.0","result":["0x1ce27228fe0f43221a0bd9bc42506021159d019fba7c18aeb33f9bcd788de06a","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbe"]}

--- thread ID: 0x2324, 2021.07.31 15:28:35.832
epoch = 220 (next epoch in 21794 blocks), share difficulty = 4 GH.

>>> thread ID: 0xe6c, 2021.07.31 15:28:41.060, 5228 ms
{"id":0,"jsonrpc":"2.0","result":["0x546a21fc1caca16abad090c76fafe592322da010cd55006eec1afd1be8a1e76d","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffbf"]}

--- thread ID: 0xe6c, 2021.07.31 15:28:41.060
epoch = 220 (next epoch in 21793 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2100, 2021.07.31 15:28:42.929, 1868 ms
{"id":0,"jsonrpc":"2.0","result":["0x6ee481312a5a14f61884479e8e8699eeeab66a528d5907787f133fc28cf5a4b9","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc0"]}

--- thread ID: 0x2100, 2021.07.31 15:28:42.929
epoch = 220 (next epoch in 21792 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:28:45.439, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:01:15.940)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:01:20.105, 56 ms], [fan = 75%, 1729 rpm, 57°C], 30.550923 MH/s (108.58 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 1, S = 0, R = 0, I = 0], [00:00:25.770, 52 ms], [fan = 75%, 1742 rpm, 57°C], 30.516895 MH/s (108.90 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 1, S = 0, R = 0, I = 0], [00:00:29.531, 25 ms], [fan = 75%, 1722 rpm, 63°C], 30.489870 MH/s (109.33 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 0, S = 0, R = 0, I = 0], [00:01:20.105,  0 ms], [fan = 75%, 1733 rpm, 56°C], 30.465662 MH/s (109.24 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:01:20.105,  0 ms], [fan = 75%, 1725 rpm, 60°C], 30.426789 MH/s (109.34 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 1, S = 0, R = 0, I = 0], [00:00:50.986,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.508302 MH/s (108.54 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:01:20.105,  0 ms], [fan = 75%, 1725 rpm, 56°C], 30.391183 MH/s (108.28 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 0, S = 0, R = 0, I = 0], [00:01:20.105,  0 ms], [fan = 75%, 1726 rpm, 57°C], 30.363703 MH/s (108.73 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:01:20.105,  0 ms], [fan = 75%, 1726 rpm, 64°C], 30.489780 MH/s (108.71 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 1, S = 0, R = 0, I = 0], [00:00:26.275,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.490980 MH/s (109.04 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 0, S = 0, R = 0, I = 0], [00:01:20.105,  0 ms], [fan = 75%, 1727 rpm, 58°C], 30.443337 MH/s (109.20 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:01:20.105,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.363561 MH/s (108.19 W) = 365.500985 MH/s (1306.06 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:28:45.606, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015c91a39","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:28:45.628, 2699 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1f8c, 2021.07.31 15:28:46.894, 1265 ms
{"id":0,"jsonrpc":"2.0","result":["0xa83b1b0e0800fb1cc8433d36dcfbf2dd592156b4801cadef189abdb5fd7e69e1","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc0"]}

--- thread ID: 0x1f8c, 2021.07.31 15:28:46.894
epoch = 220 (next epoch in 21792 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1140, 2021.07.31 15:28:47.721, 826 ms
{"id":0,"jsonrpc":"2.0","result":["0x5d1a593e8c248bf17752b9005d83cd341a2e32d4614c25798d4cca6536015842","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc1"]}

--- thread ID: 0x1140, 2021.07.31 15:28:47.721
epoch = 220 (next epoch in 21791 blocks), share difficulty = 4 GH.

--- thread ID: 0xf60, 2021.07.31 15:28:48.414, PCIe: 00000000:0a:00.0, GPU.08 share found (search channel 0).
 nonce: 0x498d0292a78490e7
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000b0511dbaae960c8cd0c50b757d1f6530a5910d45d66ad80de4fb21d2
   mix: 0x03d6732e0887bd9bd129d34074519422aeac900089cc3d545aa21c44348bf165

<<< thread ID: 0x182c, 2021.07.31 15:28:48.414, 0 ms
{"jsonrpc":"2.0","id":1005,"method":"eth_submitWork","params":["0x498d0292a78490e7","0x5d1a593e8c248bf17752b9005d83cd341a2e32d4614c25798d4cca6536015842","0x03d6732e0887bd9bd129d34074519422aeac900089cc3d545aa21c44348bf165"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:28:48.437, PCIe: 00000000:0a:00.0, GPU.08 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:28:48.437, 715 ms (22 ms)
{"id":1005,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1ae8, 2021.07.31 15:28:58.435, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 0).
 nonce: 0x498d029381f89325
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000ffd83904ecfcc0d6fa2f0f9c4857745eca349ae607d8196b66a12e13
   mix: 0x394a49bc95b0518de72bd53056267f620f9cf8a6192502bcd72c3b19192fcda2

<<< thread ID: 0x2324, 2021.07.31 15:28:58.436, 0 ms
{"jsonrpc":"2.0","id":1006,"method":"eth_submitWork","params":["0x498d029381f89325","0x5d1a593e8c248bf17752b9005d83cd341a2e32d4614c25798d4cca6536015842","0x394a49bc95b0518de72bd53056267f620f9cf8a6192502bcd72c3b19192fcda2"],"worker":"alphagruis"}

--- thread ID: 0xe6c, 2021.07.31 15:28:58.457, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0xe6c, 2021.07.31 15:28:58.457, 10020 ms (21 ms)
{"id":1006,"jsonrpc":"2.0","result":true}

--- thread ID: 0x20d8, 2021.07.31 15:28:59.804, PCIe: 00000000:04:00.0, GPU.04 share found (search channel 0).
 nonce: 0x498d02939efbe864
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000014c9a6fba3a4d9882f7e639546fff7183fea157e6386087889bf2d05
   mix: 0x6907ec3c2f61a19da2ed1b5388dd9e82b9304fbaeec707e82f6ae955f51ee713

<<< thread ID: 0x2100, 2021.07.31 15:28:59.804, 0 ms
{"jsonrpc":"2.0","id":1007,"method":"eth_submitWork","params":["0x498d02939efbe864","0x5d1a593e8c248bf17752b9005d83cd341a2e32d4614c25798d4cca6536015842","0x6907ec3c2f61a19da2ed1b5388dd9e82b9304fbaeec707e82f6ae955f51ee713"],"worker":"alphagruis"}

--- thread ID: 0x1fe0, 2021.07.31 15:28:59.826, PCIe: 00000000:04:00.0, GPU.04 share accepted.

>>> thread ID: 0x1fe0, 2021.07.31 15:28:59.826, 1368 ms (21 ms)
{"id":1007,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:29:00.596, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:01:31.096)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:01:35.262, 34 ms], [fan = 75%, 1719 rpm, 57°C], 30.348422 MH/s (110.61 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 1, S = 0, R = 0, I = 0], [00:00:40.926, 34 ms], [fan = 75%, 1718 rpm, 58°C], 30.395179 MH/s (110.55 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 1, S = 0, R = 0, I = 0], [00:00:44.688, 34 ms], [fan = 75%, 1722 rpm, 63°C], 30.470921 MH/s (110.41 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 1, S = 0, R = 0, I = 0], [00:00:00.792,  0 ms], [fan = 75%, 1724 rpm, 57°C], 30.353245 MH/s (108.89 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:01:35.262,  0 ms], [fan = 75%, 1728 rpm, 60°C], 30.359355 MH/s (109.55 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 1, S = 0, R = 0, I = 0], [00:01:06.142,  0 ms], [fan = 75%, 1722 rpm, 60°C], 30.458762 MH/s (111.04 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:01:35.262,  0 ms], [fan = 75%, 1736 rpm, 57°C], 30.360276 MH/s (108.98 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:00:12.182,  0 ms], [fan = 75%, 1734 rpm, 57°C], 30.383743 MH/s (110.15 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:01:35.262,  0 ms], [fan = 75%, 1721 rpm, 64°C], 30.405125 MH/s (109.69 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 1, S = 0, R = 0, I = 0], [00:00:41.431,  0 ms], [fan = 75%, 1722 rpm, 62°C], 30.396659 MH/s (109.00 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 1, S = 0, R = 0, I = 0], [00:00:02.160,  0 ms], [fan = 75%, 1736 rpm, 58°C], 30.500517 MH/s (110.18 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:01:35.262,  0 ms], [fan = 75%, 1732 rpm, 62°C], 30.393529 MH/s ( 99.95 W) = 364.825733 MH/s (1309.01 W)

<<< thread ID: 0x1e74, 2021.07.31 15:29:00.798, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015becc85","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1f8c, 2021.07.31 15:29:00.819, 993 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1140, 2021.07.31 15:29:07.103, 6284 ms
{"id":0,"jsonrpc":"2.0","result":["0xff4616381a328c6ed21c32fe0ccb8920f442dbd2492dd1d32dd483796bd1e437","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc2"]}

--- thread ID: 0x1140, 2021.07.31 15:29:07.103
epoch = 220 (next epoch in 21790 blocks), share difficulty = 4 GH.

>>> thread ID: 0x182c, 2021.07.31 15:29:08.605, 1502 ms
{"id":0,"jsonrpc":"2.0","result":["0x49cb6d1a5f59a0eca589d1931cda1c0ac2bf6bdc0d01e79261bc31b2aaa4b0c0","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc3"]}

--- thread ID: 0x182c, 2021.07.31 15:29:08.605
epoch = 220 (next epoch in 21789 blocks), share difficulty = 4 GH.

--- thread ID: 0x1ae8, 2021.07.31 15:29:09.934, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 1).
 nonce: 0x498d02947cb2c7bc
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000008064ad72e68c14b41e8720b73d2d4440a202729cd4d0869f636e12bf
   mix: 0x2c8297bf305b6c40b01e83f314552ba4fc54d5575ef4dab037aef798c8ba52ea

<<< thread ID: 0x8d8, 2021.07.31 15:29:09.934, 0 ms
{"jsonrpc":"2.0","id":1008,"method":"eth_submitWork","params":["0x498d02947cb2c7bc","0x49cb6d1a5f59a0eca589d1931cda1c0ac2bf6bdc0d01e79261bc31b2aaa4b0c0","0x2c8297bf305b6c40b01e83f314552ba4fc54d5575ef4dab037aef798c8ba52ea"],"worker":"alphagruis"}

--- thread ID: 0x2324, 2021.07.31 15:29:09.956, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x2324, 2021.07.31 15:29:09.956, 1350 ms (21 ms)
{"id":1008,"jsonrpc":"2.0","result":true}

>>> thread ID: 0xe6c, 2021.07.31 15:29:10.472, 516 ms
{"id":0,"jsonrpc":"2.0","result":["0xd8d8a4cd3bcfb905b2ab859b30a1da14b1718bc08b11ec14cec6695642252fa1","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc4"]}

--- thread ID: 0xe6c, 2021.07.31 15:29:10.472
epoch = 220 (next epoch in 21788 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:29:15.800, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:01:46.300)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:01:50.466, 54 ms], [fan = 75%, 1724 rpm, 58°C], 30.578420 MH/s (111.37 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 1, S = 0, R = 0, I = 0], [00:00:56.130, 38 ms], [fan = 75%, 1715 rpm, 58°C], 30.541273 MH/s (108.99 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 1, S = 0, R = 0, I = 0], [00:00:59.892,  0 ms], [fan = 75%, 1724 rpm, 64°C], 30.560025 MH/s (108.98 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 1, S = 0, R = 0, I = 0], [00:00:15.996,  0 ms], [fan = 75%, 1718 rpm, 57°C], 30.559768 MH/s (110.14 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:01:50.466,  0 ms], [fan = 75%, 1722 rpm, 60°C], 30.566397 MH/s (108.30 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 1, S = 0, R = 0, I = 0], [00:01:21.347,  0 ms], [fan = 75%, 1725 rpm, 60°C], 30.556397 MH/s (108.78 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:01:50.466,  0 ms], [fan = 75%, 1730 rpm, 57°C], 30.557031 MH/s (108.86 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:00:27.386,  0 ms], [fan = 75%, 1725 rpm, 57°C], 30.553315 MH/s (108.89 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:01:50.466,  0 ms], [fan = 75%, 1726 rpm, 65°C], 30.540619 MH/s (109.69 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 1, S = 0, R = 0, I = 0], [00:00:56.635,  0 ms], [fan = 75%, 1722 rpm, 63°C], 30.517655 MH/s (109.13 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 2, S = 0, R = 0, I = 0], [00:00:05.866,  0 ms], [fan = 75%, 1731 rpm, 59°C], 30.543796 MH/s (109.55 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:01:50.466,  0 ms], [fan = 75%, 1721 rpm, 63°C], 30.518252 MH/s (109.16 W) = 366.592948 MH/s (1311.84 W)

<<< thread ID: 0x2100, 2021.07.31 15:29:15.996, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9c3b4","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1fe0, 2021.07.31 15:29:16.017, 5545 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1e74, 2021.07.31 15:29:29.071, 13054 ms
{"id":0,"jsonrpc":"2.0","result":["0x334929ffa628856e3bb391d582970cc4e97f968ded8a1a8216ff1a083780f656","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc5"]}

--- thread ID: 0x1e74, 2021.07.31 15:29:29.072
epoch = 220 (next epoch in 21787 blocks), share difficulty = 4 GH.

--- thread ID: 0x1ae8, 2021.07.31 15:29:29.944, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 1).
 nonce: 0x498d029631e7d19e
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000ab78e09be4fc7e9bfe59774d4f5b9f53ab3b8242b021989fe425dfa0
   mix: 0x82e1a4565cecc82ade3661c59554b87cd0f09380eec62496ebd9a92cb6488585

<<< thread ID: 0x1f8c, 2021.07.31 15:29:29.944, 0 ms
{"jsonrpc":"2.0","id":1009,"method":"eth_submitWork","params":["0x498d029631e7d19e","0x334929ffa628856e3bb391d582970cc4e97f968ded8a1a8216ff1a083780f656","0x82e1a4565cecc82ade3661c59554b87cd0f09380eec62496ebd9a92cb6488585"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:29:29.967, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:29:29.967, 895 ms (22 ms)
{"id":1009,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:29:31.002, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:02:01.502)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:02:05.668, 4 ms], [fan = 75%, 1713 rpm, 58°C], 30.569758 MH/s (111.28 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 1, S = 0, R = 0, I = 0], [00:01:11.332, 0 ms], [fan = 75%, 1725 rpm, 59°C], 30.560861 MH/s (108.99 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 1, S = 0, R = 0, I = 0], [00:01:15.094, 0 ms], [fan = 75%, 1724 rpm, 64°C], 30.563561 MH/s (111.07 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 1, S = 0, R = 0, I = 0], [00:00:31.198, 0 ms], [fan = 75%, 1721 rpm, 57°C], 30.572767 MH/s (110.07 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:02:05.668, 0 ms], [fan = 75%, 1730 rpm, 61°C], 30.563116 MH/s (109.55 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 1, S = 0, R = 0, I = 0], [00:01:36.548, 0 ms], [fan = 75%, 1731 rpm, 61°C], 30.556054 MH/s (111.62 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:02:05.668, 0 ms], [fan = 75%, 1720 rpm, 58°C], 30.556815 MH/s (108.14 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:00:42.588, 0 ms], [fan = 75%, 1723 rpm, 58°C], 30.552493 MH/s (108.08 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:02:05.668, 0 ms], [fan = 75%, 1721 rpm, 65°C], 30.547601 MH/s (109.92 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 1, S = 0, R = 0, I = 0], [00:01:11.837, 0 ms], [fan = 75%, 1717 rpm, 63°C], 30.522486 MH/s (110.12 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 3, S = 0, R = 0, I = 0], [00:00:01.057, 0 ms], [fan = 75%, 1729 rpm, 59°C], 30.547059 MH/s (109.64 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:02:05.668, 0 ms], [fan = 75%, 1726 rpm, 63°C], 30.522992 MH/s (109.16 W) = 366.635563 MH/s (1317.63 W)

<<< thread ID: 0x182c, 2021.07.31 15:29:31.171, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da6a2b","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x8d8, 2021.07.31 15:29:31.193, 1225 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1ae8, 2021.07.31 15:29:35.033, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 1).
 nonce: 0x498d0296a113edc7
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000011fe5a58b070d32ba82da4a46aed58aea12abd89a508474ad8680acc
   mix: 0x5a00db832f91b47d97a0b6ecb687ccfa8899b0bcc98fce23d1ee2c912c61b86c

<<< thread ID: 0x2324, 2021.07.31 15:29:35.033, 0 ms
{"jsonrpc":"2.0","id":1010,"method":"eth_submitWork","params":["0x498d0296a113edc7","0x334929ffa628856e3bb391d582970cc4e97f968ded8a1a8216ff1a083780f656","0x5a00db832f91b47d97a0b6ecb687ccfa8899b0bcc98fce23d1ee2c912c61b86c"],"worker":"alphagruis"}

--- thread ID: 0xe6c, 2021.07.31 15:29:35.055, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0xe6c, 2021.07.31 15:29:35.055, 3862 ms (21 ms)
{"id":1010,"jsonrpc":"2.0","result":true}

--- thread ID: 0xee0, 2021.07.31 15:29:36.105, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 0).
 nonce: 0x498d0296b842957d
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000000af9acbac87b7530969c52035a3a36c87fe01ac1b75d531a3c167d9d
   mix: 0x9aff452d4c5b8e069ef2d7b7742147fde7ca854d631259d34c04cdb8c37dd484

<<< thread ID: 0x2100, 2021.07.31 15:29:36.105, 0 ms
{"jsonrpc":"2.0","id":1011,"method":"eth_submitWork","params":["0x498d0296b842957d","0x334929ffa628856e3bb391d582970cc4e97f968ded8a1a8216ff1a083780f656","0x9aff452d4c5b8e069ef2d7b7742147fde7ca854d631259d34c04cdb8c37dd484"],"worker":"alphagruis"}

--- thread ID: 0x1fe0, 2021.07.31 15:29:36.126, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0x1fe0, 2021.07.31 15:29:36.126, 1070 ms (21 ms)
{"id":1011,"jsonrpc":"2.0","result":true}

--- thread ID: 0x120c, 2021.07.31 15:29:36.814, PCIe: 00000000:06:00.0, GPU.06 share found (search channel 0).
 nonce: 0x498d0296c7e28add
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000016c60230acb7d1a8e7ed6fa29a9d07030ea7599b46c3a36bbee3175c
   mix: 0x23517bd240bc408bac291af015c01897ff176f088b66820610a2ed071890322e

<<< thread ID: 0x1e74, 2021.07.31 15:29:36.814, 0 ms
{"jsonrpc":"2.0","id":1012,"method":"eth_submitWork","params":["0x498d0296c7e28add","0x334929ffa628856e3bb391d582970cc4e97f968ded8a1a8216ff1a083780f656","0x23517bd240bc408bac291af015c01897ff176f088b66820610a2ed071890322e"],"worker":"alphagruis"}

--- thread ID: 0x1f8c, 2021.07.31 15:29:36.835, PCIe: 00000000:06:00.0, GPU.06 share accepted.

>>> thread ID: 0x1f8c, 2021.07.31 15:29:36.835, 708 ms (20 ms)
{"id":1012,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1140, 2021.07.31 15:29:37.563, 728 ms
{"id":0,"jsonrpc":"2.0","result":["0x3f0e41172dd43c012890def3ac18b2b8138fa998014194693675156b347db1b9","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc6"]}

--- thread ID: 0x1140, 2021.07.31 15:29:37.563
epoch = 220 (next epoch in 21786 blocks), share difficulty = 4 GH.

>>> thread ID: 0x182c, 2021.07.31 15:29:38.529, 965 ms
{"id":0,"jsonrpc":"2.0","result":["0xb8cf90f162f1fc392f49e11f63e998a44053c457602fe8b36169245fef98ab5b","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc7"]}

--- thread ID: 0x182c, 2021.07.31 15:29:38.529
epoch = 220 (next epoch in 21785 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:29:46.174, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:02:16.674)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:02:20.840, 60 ms], [fan = 75%, 1726 rpm, 58°C], 30.572515 MH/s (108.77 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 2, S = 0, R = 0, I = 0], [00:00:10.069, 29 ms], [fan = 75%, 1702 rpm, 59°C], 30.543347 MH/s (108.80 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 1, S = 0, R = 0, I = 0], [00:01:30.266,  0 ms], [fan = 75%, 1743 rpm, 64°C], 30.555253 MH/s (109.39 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 1, S = 0, R = 0, I = 0], [00:00:46.370,  0 ms], [fan = 75%, 1727 rpm, 58°C], 30.569140 MH/s (109.25 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:02:20.840,  0 ms], [fan = 75%, 1717 rpm, 61°C], 30.559857 MH/s (111.17 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 2, S = 0, R = 0, I = 0], [00:00:09.360,  0 ms], [fan = 75%, 1717 rpm, 61°C], 30.533336 MH/s (111.62 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:02:20.840,  0 ms], [fan = 75%, 1712 rpm, 58°C], 30.544098 MH/s (109.16 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:00:57.760,  0 ms], [fan = 75%, 1731 rpm, 58°C], 30.533777 MH/s (109.06 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:02:20.840,  0 ms], [fan = 75%, 1718 rpm, 65°C], 30.539278 MH/s (108.93 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 1, S = 0, R = 0, I = 0], [00:01:27.009,  0 ms], [fan = 75%, 1719 rpm, 63°C], 30.520110 MH/s (109.20 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:00:11.141,  0 ms], [fan = 75%, 1720 rpm, 59°C], 30.545558 MH/s (109.78 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:02:20.840,  0 ms], [fan = 75%, 1735 rpm, 63°C], 30.520772 MH/s (109.39 W) = 366.537041 MH/s (1314.54 W)

<<< thread ID: 0x8d8, 2021.07.31 15:29:46.345, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8e951","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2324, 2021.07.31 15:29:46.366, 7836 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xd20, 2021.07.31 15:29:58.462, PCIe: 00000000:0d:00.0, GPU.10 share found (search channel 1).
 nonce: 0x498d0298a0bd774e
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000008217f4e774ce1d0b4ef5dfee42f014ef7765452f61ff15111daa704e
   mix: 0x8ba339dd38cf19b0b2172214738e367be7914135f04edf90fc6c1091e1553513

<<< thread ID: 0xe6c, 2021.07.31 15:29:58.462, 0 ms
{"jsonrpc":"2.0","id":1013,"method":"eth_submitWork","params":["0x498d0298a0bd774e","0xb8cf90f162f1fc392f49e11f63e998a44053c457602fe8b36169245fef98ab5b","0x8ba339dd38cf19b0b2172214738e367be7914135f04edf90fc6c1091e1553513"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:29:58.483, PCIe: 00000000:0d:00.0, GPU.10 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:29:58.483, 12117 ms (21 ms)
{"id":1013,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1fe0, 2021.07.31 15:29:59.419, 935 ms
{"id":0,"jsonrpc":"2.0","result":["0xe4f1768743a6d81bca718662613436a270c2453bc2ea38ddfc834be85d1c178b","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc8"]}

--- thread ID: 0x1fe0, 2021.07.31 15:29:59.419
epoch = 220 (next epoch in 21784 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:30:01.345, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:02:31.846)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:02:36.011, 49 ms], [fan = 75%, 1721 rpm, 58°C], 30.574523 MH/s (108.80 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 2, S = 0, R = 0, I = 0], [00:00:25.241, 62 ms], [fan = 75%, 1710 rpm, 59°C], 30.521755 MH/s (108.78 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 1, S = 0, R = 0, I = 0], [00:01:45.437, 22 ms], [fan = 75%, 1741 rpm, 65°C], 30.562926 MH/s (108.41 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 1, S = 0, R = 0, I = 0], [00:01:01.542,  0 ms], [fan = 75%, 1721 rpm, 58°C], 30.570597 MH/s (109.16 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 0, S = 0, R = 0, I = 0], [00:02:36.011,  0 ms], [fan = 75%, 1719 rpm, 61°C], 30.567175 MH/s (111.01 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 2, S = 0, R = 0, I = 0], [00:00:24.531,  0 ms], [fan = 75%, 1720 rpm, 61°C], 30.535269 MH/s (109.72 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:02:36.011,  0 ms], [fan = 75%, 1723 rpm, 58°C], 30.551593 MH/s (108.14 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:01:12.931,  0 ms], [fan = 75%, 1740 rpm, 58°C], 30.537590 MH/s (108.96 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:02:36.011,  0 ms], [fan = 75%, 1726 rpm, 66°C], 30.547794 MH/s (111.68 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 2, S = 0, R = 0, I = 0], [00:00:02.883,  0 ms], [fan = 75%, 1728 rpm, 64°C], 30.513933 MH/s (108.93 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:00:26.313,  0 ms], [fan = 75%, 1739 rpm, 59°C], 30.539044 MH/s (109.35 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 0, S = 0, R = 0, I = 0], [00:02:36.011,  0 ms], [fan = 75%, 1718 rpm, 63°C], 30.512719 MH/s (111.08 W) = 366.534918 MH/s (1314.01 W)

<<< thread ID: 0x1e74, 2021.07.31 15:30:01.552, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8e106","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

--- thread ID: 0x2aac, 2021.07.31 15:30:01.560, PCIe: 00000000:0f:00.0, GPU.12 share found (search channel 0).
 nonce: 0x498d0298e468051c
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000cd8f6bf55b4e847e610c4ffcf93a0ec9b758ac5076bd15e217b5424d
   mix: 0x502bf80dca12e009423e0413b2ea5d0eae31003a2299c5602cea2769480157dc

<<< thread ID: 0x1f8c, 2021.07.31 15:30:01.561, 0 ms
{"jsonrpc":"2.0","id":1014,"method":"eth_submitWork","params":["0x498d0298e468051c","0xe4f1768743a6d81bca718662613436a270c2453bc2ea38ddfc834be85d1c178b","0x502bf80dca12e009423e0413b2ea5d0eae31003a2299c5602cea2769480157dc"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:30:01.573, 2154 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x182c, 2021.07.31 15:30:01.594, PCIe: 00000000:0f:00.0, GPU.12 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:30:01.594, 20 ms (33 ms)
{"id":1014,"jsonrpc":"2.0","result":true}

--- thread ID: 0x11d8, 2021.07.31 15:30:04.420, PCIe: 00000000:05:00.0, GPU.05 share found (search channel 1).
 nonce: 0x498d0299230a64b9
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000082586f4de27342d47c7ac62d1eea6b46a36f3666d907bd678843af3a
   mix: 0xd14bb5a6f624708a62093bde05d112541d0e451862e13057aee18113f2c5179b

<<< thread ID: 0x8d8, 2021.07.31 15:30:04.420, 0 ms
{"jsonrpc":"2.0","id":1015,"method":"eth_submitWork","params":["0x498d0299230a64b9","0xe4f1768743a6d81bca718662613436a270c2453bc2ea38ddfc834be85d1c178b","0xd14bb5a6f624708a62093bde05d112541d0e451862e13057aee18113f2c5179b"],"worker":"alphagruis"}

--- thread ID: 0x2324, 2021.07.31 15:30:04.443, PCIe: 00000000:05:00.0, GPU.05 share accepted.

>>> thread ID: 0x2324, 2021.07.31 15:30:04.443, 2848 ms (23 ms)
{"id":1015,"jsonrpc":"2.0","result":true}

--- thread ID: 0x20d8, 2021.07.31 15:30:06.533, PCIe: 00000000:04:00.0, GPU.04 share found (search channel 1).
 nonce: 0x498d0299516284ad
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000000cb8e3f25bd7271b702747117d4359248b87e27003b51e059b321810
   mix: 0x4d330a92c08a607fa4a2a131d243741c3ce41891207401ba82c4f0c4cceef882

<<< thread ID: 0xe6c, 2021.07.31 15:30:06.533, 0 ms
{"jsonrpc":"2.0","id":1016,"method":"eth_submitWork","params":["0x498d0299516284ad","0xe4f1768743a6d81bca718662613436a270c2453bc2ea38ddfc834be85d1c178b","0x4d330a92c08a607fa4a2a131d243741c3ce41891207401ba82c4f0c4cceef882"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:30:06.555, PCIe: 00000000:04:00.0, GPU.04 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:30:06.555, 2112 ms (21 ms)
{"id":1016,"jsonrpc":"2.0","result":true}

--- thread ID: 0xa50, 2021.07.31 15:30:08.471, PCIe: 00000000:03:00.0, GPU.03 share found (search channel 1).
 nonce: 0x498d02997b906d51
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000b7f3b81f5199006ce4b689d1aead0b26c1ccc86c7b073e74d6655b00
   mix: 0xb28f328658051a8bcaadf04eea0ff289a12993c78471a707fbfb819fc671141b

<<< thread ID: 0x1fe0, 2021.07.31 15:30:08.471, 0 ms
{"jsonrpc":"2.0","id":1017,"method":"eth_submitWork","params":["0x498d02997b906d51","0xe4f1768743a6d81bca718662613436a270c2453bc2ea38ddfc834be85d1c178b","0xb28f328658051a8bcaadf04eea0ff289a12993c78471a707fbfb819fc671141b"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:30:08.494, PCIe: 00000000:03:00.0, GPU.03 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:30:08.494, 1939 ms (22 ms)
{"id":1017,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1f8c, 2021.07.31 15:30:12.524, 4030 ms
{"id":0,"jsonrpc":"2.0","result":["0xa0882bc7cf090b6ffcbc7c82186160b9e93fca8127e3aa19233875abde46560f","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffc9"]}

--- thread ID: 0x1f8c, 2021.07.31 15:30:12.524
epoch = 220 (next epoch in 21783 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:30:16.549, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:02:47.049)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:02:51.215,  2 ms], [fan = 75%, 1734 rpm, 58°C], 30.575915 MH/s (108.40 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 2, S = 0, R = 0, I = 0], [00:00:40.445,  7 ms], [fan = 75%, 1744 rpm, 59°C], 30.559392 MH/s (109.20 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:00:08.078, 37 ms], [fan = 75%, 1708 rpm, 65°C], 30.565890 MH/s (109.22 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:00:10.016,  0 ms], [fan = 75%, 1716 rpm, 58°C], 30.568803 MH/s (110.35 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:00:12.130,  0 ms], [fan = 75%, 1722 rpm, 61°C], 30.564830 MH/s (109.97 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 2, S = 0, R = 0, I = 0], [00:00:39.735,  0 ms], [fan = 75%, 1740 rpm, 61°C], 30.555007 MH/s (109.11 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:02:51.215,  0 ms], [fan = 75%, 1712 rpm, 58°C], 30.551909 MH/s (109.27 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:01:28.135,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.546692 MH/s (108.54 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:02:51.215,  0 ms], [fan = 75%, 1732 rpm, 66°C], 30.513634 MH/s (110.15 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 2, S = 0, R = 0, I = 0], [00:00:18.087,  0 ms], [fan = 75%, 1731 rpm, 64°C], 30.514364 MH/s (109.20 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:00:41.516,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.545514 MH/s (109.64 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 1, S = 0, R = 0, I = 0], [00:00:14.989,  0 ms], [fan = 75%, 1732 rpm, 64°C], 30.537312 MH/s (108.97 W) = 366.599262 MH/s (1312.04 W)

<<< thread ID: 0x1140, 2021.07.31 15:30:16.798, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9dc5e","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x182c, 2021.07.31 15:30:17.082, 4557 ms (283 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x120c, 2021.07.31 15:30:21.181, PCIe: 00000000:06:00.0, GPU.06 share found (search channel 0).
 nonce: 0x498d029a911a13f9
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000ac4a2eb14a8ad587f3e8ffe157268f537f88fd01a6f14ab3b9ec8def
   mix: 0x00b5fb8b7adde2279e517c0bab22a4860c6b1a512147092e46905c9b0ecd9d9a

<<< thread ID: 0x8d8, 2021.07.31 15:30:21.181, 0 ms
{"jsonrpc":"2.0","id":1018,"method":"eth_submitWork","params":["0x498d029a911a13f9","0xa0882bc7cf090b6ffcbc7c82186160b9e93fca8127e3aa19233875abde46560f","0x00b5fb8b7adde2279e517c0bab22a4860c6b1a512147092e46905c9b0ecd9d9a"],"worker":"alphagruis"}

--- thread ID: 0x2324, 2021.07.31 15:30:21.202, PCIe: 00000000:06:00.0, GPU.06 share accepted.

>>> thread ID: 0x2324, 2021.07.31 15:30:21.202, 4120 ms (21 ms)
{"id":1018,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:30:31.807, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:03:02.307)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:03:06.473,  9 ms], [fan = 75%, 1724 rpm, 59°C], 30.575638 MH/s (111.04 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 2, S = 0, R = 0, I = 0], [00:00:55.702,  5 ms], [fan = 75%, 1718 rpm, 59°C], 30.558692 MH/s (109.26 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:00:23.335, 34 ms], [fan = 75%, 1727 rpm, 65°C], 30.557201 MH/s (109.87 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:00:25.274,  0 ms], [fan = 75%, 1722 rpm, 58°C], 30.572699 MH/s (109.90 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:00:27.387, 21 ms], [fan = 75%, 1720 rpm, 62°C], 30.507474 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 3, S = 0, R = 0, I = 0], [00:00:10.626, 21 ms], [fan = 75%, 1723 rpm, 61°C], 30.502907 MH/s (108.45 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:03:06.472,  0 ms], [fan = 75%, 1737 rpm, 59°C], 30.556358 MH/s (108.04 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:01:43.392,  0 ms], [fan = 75%, 1717 rpm, 59°C], 30.523225 MH/s (109.53 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:03:06.472,  0 ms], [fan = 75%, 1724 rpm, 66°C], 30.528202 MH/s (109.45 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 2, S = 0, R = 0, I = 0], [00:00:33.345,  0 ms], [fan = 75%, 1722 rpm, 64°C], 30.503399 MH/s (108.79 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:00:56.774,  0 ms], [fan = 75%, 1719 rpm, 60°C], 30.502022 MH/s (110.59 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 1, S = 0, R = 0, I = 0], [00:00:30.246,  0 ms], [fan = 75%, 1707 rpm, 64°C], 30.523369 MH/s (108.97 W) = 366.411186 MH/s (1313.77 W)

<<< thread ID: 0xe6c, 2021.07.31 15:30:31.984, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d6fdb2","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2100, 2021.07.31 15:30:32.005, 10802 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:30:46.990, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:03:17.491)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:03:21.656,  7 ms], [fan = 75%, 1737 rpm, 59°C], 30.557871 MH/s (111.34 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 2, S = 0, R = 0, I = 0], [00:01:10.886,  0 ms], [fan = 75%, 1715 rpm, 59°C], 30.535339 MH/s (108.45 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:00:38.519, 26 ms], [fan = 75%, 1724 rpm, 65°C], 30.564728 MH/s (109.87 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:00:40.458,  0 ms], [fan = 75%, 1738 rpm, 58°C], 30.573827 MH/s (109.26 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:00:42.571,  7 ms], [fan = 75%, 1728 rpm, 62°C], 30.551469 MH/s (108.86 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 3, S = 0, R = 0, I = 0], [00:00:25.810,  6 ms], [fan = 75%, 1723 rpm, 62°C], 30.546638 MH/s (109.11 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:03:21.656,  0 ms], [fan = 75%, 1720 rpm, 59°C], 30.556060 MH/s (108.47 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:01:58.576,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.554514 MH/s (107.73 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:03:21.656,  0 ms], [fan = 75%, 1721 rpm, 66°C], 30.547031 MH/s (110.24 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 2, S = 0, R = 0, I = 0], [00:00:48.528,  0 ms], [fan = 75%, 1734 rpm, 64°C], 30.515678 MH/s (110.53 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:01:11.958,  0 ms], [fan = 75%, 1721 rpm, 60°C], 30.518207 MH/s (110.67 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 1, S = 0, R = 0, I = 0], [00:00:45.430,  0 ms], [fan = 75%, 1724 rpm, 64°C], 30.543912 MH/s (108.97 W) = 366.565274 MH/s (1313.51 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:30:47.122, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9579a","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:30:47.146, 15140 ms (24 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xee0, 2021.07.31 15:31:02.340, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 0).
 nonce: 0x498d029e14837bb3
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000014c929dfaf502dcf8dba42360d5ea3dc8b9746ec0c4892f4123ed733
   mix: 0x44d5eac7a459e03cbbb06fe38d2d5c16a0f183e9194f792a23ff3896c43f4388

<<< thread ID: 0x1f8c, 2021.07.31 15:31:02.340, 0 ms
{"jsonrpc":"2.0","id":1019,"method":"eth_submitWork","params":["0x498d029e14837bb3","0xa0882bc7cf090b6ffcbc7c82186160b9e93fca8127e3aa19233875abde46560f","0x44d5eac7a459e03cbbb06fe38d2d5c16a0f183e9194f792a23ff3896c43f4388"],"worker":"alphagruis"}

--- thread ID: 0x1eb4, 2021.07.31 15:31:02.129, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:03:32.629)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:03:36.795, 34 ms], [fan = 75%, 1742 rpm, 59°C], 30.577808 MH/s (111.62 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 2, S = 0, R = 0, I = 0], [00:01:26.025, 63 ms], [fan = 75%, 1760 rpm, 60°C], 30.527448 MH/s (110.69 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:00:53.658,  0 ms], [fan = 75%, 1738 rpm, 65°C], 30.562994 MH/s (107.89 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:00:55.596,  0 ms], [fan = 75%, 1724 rpm, 59°C], 30.572069 MH/s (110.56 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:00:57.710,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.562692 MH/s (109.83 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 3, S = 0, R = 0, I = 0], [00:00:40.948,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.555604 MH/s (108.35 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:03:36.795,  0 ms], [fan = 75%, 1731 rpm, 59°C], 30.536103 MH/s (108.70 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:02:13.715,  0 ms], [fan = 75%, 1720 rpm, 59°C], 30.556717 MH/s (111.08 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:03:36.795,  0 ms], [fan = 75%, 1737 rpm, 66°C], 30.533504 MH/s (109.25 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 2, S = 0, R = 0, I = 0], [00:01:03.667,  0 ms], [fan = 75%, 1734 rpm, 64°C], 30.527740 MH/s (109.58 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:01:27.096,  0 ms], [fan = 75%, 1716 rpm, 60°C], 30.549712 MH/s (109.64 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 1, S = 0, R = 0, I = 0], [00:01:00.569,  0 ms], [fan = 75%, 1721 rpm, 64°C], 30.529796 MH/s (111.29 W) = 366.592187 MH/s (1318.49 W)

<<< thread ID: 0x1140, 2021.07.31 15:31:02.352, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9c0bb","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

--- thread ID: 0x182c, 2021.07.31 15:31:02.365, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:31:02.365, 15218 ms (24 ms)
{"id":1019,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x8d8, 2021.07.31 15:31:02.385, 20 ms (33 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2324, 2021.07.31 15:31:08.383, 5997 ms
{"id":0,"jsonrpc":"2.0","result":["0x65a81f3fb7ccb6ac7d63c5935dacbd47e37d85651c1a0581371a9346e5c98b15","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffca"]}

--- thread ID: 0x2324, 2021.07.31 15:31:08.383
epoch = 220 (next epoch in 21782 blocks), share difficulty = 4 GH.

--- thread ID: 0xd20, 2021.07.31 15:31:10.044, PCIe: 00000000:0d:00.0, GPU.10 share found (search channel 1).
 nonce: 0x498d029ebcdce61c
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000a4d63c9c5ad6b1ab45d40df8760f714df6b992e0433220285ce9c150
   mix: 0x532c88ee2b83fef66e768cf781c6b57abe900e1bdde1992948de3796380eb668

<<< thread ID: 0xe6c, 2021.07.31 15:31:10.045, 0 ms
{"jsonrpc":"2.0","id":1020,"method":"eth_submitWork","params":["0x498d029ebcdce61c","0x65a81f3fb7ccb6ac7d63c5935dacbd47e37d85651c1a0581371a9346e5c98b15","0x532c88ee2b83fef66e768cf781c6b57abe900e1bdde1992948de3796380eb668"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:31:10.316, PCIe: 00000000:0d:00.0, GPU.10 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:31:10.316, 1933 ms (271 ms)
{"id":1020,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:31:17.362, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:03:47.862)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:03:52.028, 15 ms], [fan = 75%, 1721 rpm, 59°C], 30.574640 MH/s (111.32 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:00:15.022, 33 ms], [fan = 75%, 1718 rpm, 60°C], 30.561754 MH/s (109.44 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:01:08.890, 21 ms], [fan = 75%, 1730 rpm, 65°C], 30.560742 MH/s (107.85 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:01:10.829,  0 ms], [fan = 75%, 1721 rpm, 59°C], 30.566473 MH/s (109.44 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:01:12.942,  1 ms], [fan = 75%, 1728 rpm, 62°C], 30.563502 MH/s (109.65 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 3, S = 0, R = 0, I = 0], [00:00:56.181,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.521173 MH/s (109.11 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:03:52.028,  0 ms], [fan = 75%, 1715 rpm, 59°C], 30.553226 MH/s (108.14 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:02:28.948,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.550188 MH/s (108.96 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:03:52.028,  0 ms], [fan = 75%, 1726 rpm, 66°C], 30.511965 MH/s (108.77 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 3, S = 0, R = 0, I = 0], [00:00:07.317,  0 ms], [fan = 75%, 1719 rpm, 64°C], 30.547287 MH/s (108.95 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:01:42.329,  0 ms], [fan = 75%, 1729 rpm, 60°C], 30.544160 MH/s (109.80 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 1, S = 0, R = 0, I = 0], [00:01:15.801,  0 ms], [fan = 75%, 1718 rpm, 64°C], 30.512170 MH/s (109.72 W) = 366.567280 MH/s (1311.16 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:31:17.503, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d95f70","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:31:17.525, 7208 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1f8c, 2021.07.31 15:31:25.468, 7943 ms
{"id":0,"jsonrpc":"2.0","result":["0xb600f28f9912bea298962ae871f6da9a0689abd747afd2d642bcee24815993ff","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffcb"]}

--- thread ID: 0x1f8c, 2021.07.31 15:31:25.468
epoch = 220 (next epoch in 21781 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:31:32.518, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:04:03.018)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:04:07.183, 56 ms], [fan = 75%, 1726 rpm, 59°C], 30.576360 MH/s (108.88 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:00:30.177,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.535279 MH/s (109.32 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:01:24.046,  0 ms], [fan = 75%, 1716 rpm, 65°C], 30.561165 MH/s (108.27 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:01:25.985,  0 ms], [fan = 75%, 1727 rpm, 59°C], 30.575407 MH/s (109.78 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:01:28.098,  0 ms], [fan = 75%, 1730 rpm, 62°C], 30.565860 MH/s (109.65 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 3, S = 0, R = 0, I = 0], [00:01:11.337,  0 ms], [fan = 75%, 1731 rpm, 61°C], 30.552810 MH/s (110.71 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:04:07.183,  0 ms], [fan = 75%, 1712 rpm, 59°C], 30.513580 MH/s (109.94 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:02:44.103,  0 ms], [fan = 75%, 1734 rpm, 59°C], 30.556309 MH/s (109.27 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:04:07.183,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.544112 MH/s (109.54 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 3, S = 0, R = 0, I = 0], [00:00:22.473,  0 ms], [fan = 75%, 1728 rpm, 64°C], 30.546214 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:01:57.485,  0 ms], [fan = 75%, 1724 rpm, 60°C], 30.507072 MH/s (110.88 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 1, S = 0, R = 0, I = 0], [00:01:30.957,  0 ms], [fan = 75%, 1732 rpm, 64°C], 30.505010 MH/s (108.25 W) = 366.539178 MH/s (1314.15 W)

<<< thread ID: 0x1140, 2021.07.31 15:31:32.677, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8f1aa","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x182c, 2021.07.31 15:31:32.698, 7229 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2aac, 2021.07.31 15:31:35.285, PCIe: 00000000:0f:00.0, GPU.12 share found (search channel 0).
 nonce: 0x498d02a0e4122a17
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000007e655899f4dc95f57edf72bab955a8406f7afa18fd50e6995b7f7c39
   mix: 0x30793842a6bc3179e98c363e8470cec244cfecdad5da88047eb28a0f4bd476f6

<<< thread ID: 0x8d8, 2021.07.31 15:31:35.285, 0 ms
{"jsonrpc":"2.0","id":1021,"method":"eth_submitWork","params":["0x498d02a0e4122a17","0xb600f28f9912bea298962ae871f6da9a0689abd747afd2d642bcee24815993ff","0x30793842a6bc3179e98c363e8470cec244cfecdad5da88047eb28a0f4bd476f6"],"worker":"alphagruis"}

--- thread ID: 0x2324, 2021.07.31 15:31:35.307, PCIe: 00000000:0f:00.0, GPU.12 share accepted.

>>> thread ID: 0x2324, 2021.07.31 15:31:35.307, 2608 ms (21 ms)
{"id":1021,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2aac, 2021.07.31 15:31:46.296, PCIe: 00000000:0f:00.0, GPU.12 share found (search channel 0).
 nonce: 0x498d02a1d466df20
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000009520c4f392481011519d37bc475fe4d422a9e8123eb0f8d2b27695ea
   mix: 0xb1108faf00baad8e7952cabd195320f0b94957764039631b3309c6a5f5d17855

<<< thread ID: 0xe6c, 2021.07.31 15:31:46.296, 0 ms
{"jsonrpc":"2.0","id":1022,"method":"eth_submitWork","params":["0x498d02a1d466df20","0xb600f28f9912bea298962ae871f6da9a0689abd747afd2d642bcee24815993ff","0xb1108faf00baad8e7952cabd195320f0b94957764039631b3309c6a5f5d17855"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:31:46.318, PCIe: 00000000:0f:00.0, GPU.12 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:31:46.318, 11011 ms (22 ms)
{"id":1022,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:31:47.692, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:04:18.192)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:04:22.358, 48 ms], [fan = 75%, 1729 rpm, 59°C], 30.575562 MH/s (109.27 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:00:45.352, 45 ms], [fan = 75%, 1758 rpm, 60°C], 30.557352 MH/s (108.54 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:01:39.221, 26 ms], [fan = 75%, 1732 rpm, 65°C], 30.549338 MH/s (111.40 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:01:41.159, 22 ms], [fan = 75%, 1733 rpm, 58°C], 30.567556 MH/s (109.72 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:01:43.272,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.546207 MH/s (109.79 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 3, S = 0, R = 0, I = 0], [00:01:26.511,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.552713 MH/s (108.06 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:04:22.358,  0 ms], [fan = 75%, 1720 rpm, 59°C], 30.531208 MH/s (111.36 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:02:59.278,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.554267 MH/s (107.73 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:04:22.358,  0 ms], [fan = 75%, 1732 rpm, 67°C], 30.546290 MH/s (109.22 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 3, S = 0, R = 0, I = 0], [00:00:37.648,  0 ms], [fan = 75%, 1725 rpm, 65°C], 30.514086 MH/s (110.97 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 4, S = 0, R = 0, I = 0], [00:02:12.659,  0 ms], [fan = 75%, 1726 rpm, 60°C], 30.514543 MH/s (109.74 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 3, S = 0, R = 0, I = 0], [00:00:01.396,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.531078 MH/s (111.35 W) = 366.540200 MH/s (1317.14 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:31:47.887, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8f5a8","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:31:47.911, 1593 ms (23 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1ae8, 2021.07.31 15:31:51.188, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 1).
 nonce: 0x498d02a23fe9336f
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000012e715276d1cb7a3de1841a61bfb6c161cece1cba18ac3b8cc63f981
   mix: 0x6f51947dfb0d090d55850cd88add2b63a5dec50587424e285b6ef927d5988667

<<< thread ID: 0x1f8c, 2021.07.31 15:31:51.188, 0 ms
{"jsonrpc":"2.0","id":1023,"method":"eth_submitWork","params":["0x498d02a23fe9336f","0xb600f28f9912bea298962ae871f6da9a0689abd747afd2d642bcee24815993ff","0x6f51947dfb0d090d55850cd88add2b63a5dec50587424e285b6ef927d5988667"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:31:51.211, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:31:51.211, 3299 ms (22 ms)
{"id":1023,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x182c, 2021.07.31 15:31:58.218, 7007 ms
{"id":0,"jsonrpc":"2.0","result":["0x9324ccc7c995e51960e1254b1172a7ecf5f9692da87c1196b6d0353722eff584","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffcc"]}

--- thread ID: 0x182c, 2021.07.31 15:31:58.218
epoch = 220 (next epoch in 21780 blocks), share difficulty = 4 GH.

--- thread ID: 0x2aac, 2021.07.31 15:32:01.913, PCIe: 00000000:0f:00.0, GPU.12 share found (search channel 1).
 nonce: 0x498d02a32a0158bb
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000ed4f771c63de279d2de07cc44429702e0297b86a30ceb5cf913ceacd
   mix: 0x116f2e0f2b0c535fb75e65a415d1de1c33e12b78d2a6772513bf3ddc08539249

<<< thread ID: 0x8d8, 2021.07.31 15:32:01.913, 0 ms
{"jsonrpc":"2.0","id":1024,"method":"eth_submitWork","params":["0x498d02a32a0158bb","0x9324ccc7c995e51960e1254b1172a7ecf5f9692da87c1196b6d0353722eff584","0x116f2e0f2b0c535fb75e65a415d1de1c33e12b78d2a6772513bf3ddc08539249"],"worker":"alphagruis"}

--- thread ID: 0x2324, 2021.07.31 15:32:01.934, PCIe: 00000000:0f:00.0, GPU.12 share accepted.

>>> thread ID: 0x2324, 2021.07.31 15:32:01.934, 3715 ms (21 ms)
{"id":1024,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:32:02.908, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:04:33.408)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:04:37.574, 12 ms], [fan = 75%, 1719 rpm, 59°C], 30.574141 MH/s (108.78 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:01:00.568,  2 ms], [fan = 75%, 1699 rpm, 60°C], 30.555753 MH/s (109.20 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:01:54.437, 52 ms], [fan = 75%, 1719 rpm, 65°C], 30.558386 MH/s (108.66 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:01:56.375,  0 ms], [fan = 75%, 1716 rpm, 59°C], 30.562657 MH/s (110.01 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:01:58.489,  0 ms], [fan = 75%, 1733 rpm, 62°C], 30.555893 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 3, S = 0, R = 0, I = 0], [00:01:41.727,  9 ms], [fan = 75%, 1737 rpm, 62°C], 30.550127 MH/s (108.13 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:04:37.574,  0 ms], [fan = 75%, 1715 rpm, 59°C], 30.545988 MH/s (108.44 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:03:14.494,  0 ms], [fan = 75%, 1717 rpm, 60°C], 30.550709 MH/s (110.97 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:04:37.574,  0 ms], [fan = 75%, 1708 rpm, 67°C], 30.539920 MH/s (110.53 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 3, S = 0, R = 0, I = 0], [00:00:52.864,  0 ms], [fan = 75%, 1728 rpm, 64°C], 30.523837 MH/s (111.17 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 5, S = 0, R = 0, I = 0], [00:00:11.720,  0 ms], [fan = 75%, 1739 rpm, 60°C], 30.522432 MH/s (109.96 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:00:00.996,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.534805 MH/s (110.97 W) = 366.574648 MH/s (1316.70 W)

<<< thread ID: 0xe6c, 2021.07.31 15:32:03.109, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d97c38","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2100, 2021.07.31 15:32:03.129, 1195 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1fe0, 2021.07.31 15:32:03.822, 692 ms
{"id":0,"jsonrpc":"2.0","result":["0xf471192744f13d9b608c6aec0090e76ab217b655f0ff43d07d1bdbd43b8f3e8f","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffcd"]}

--- thread ID: 0x1fe0, 2021.07.31 15:32:03.822
epoch = 220 (next epoch in 21779 blocks), share difficulty = 4 GH.

--- thread ID: 0x120c, 2021.07.31 15:32:06.817, PCIe: 00000000:06:00.0, GPU.06 share found (search channel 0).
 nonce: 0x498d02a39523db38
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000661921c06f7dcad954064467b8f6c44d86f833a16167260bc4485d91
   mix: 0xad7568924ec1f8419869971a70d8e0355c1682fafa560f5ecb1c80d9f171036f

<<< thread ID: 0x1e74, 2021.07.31 15:32:06.817, 0 ms
{"jsonrpc":"2.0","id":1025,"method":"eth_submitWork","params":["0x498d02a39523db38","0xf471192744f13d9b608c6aec0090e76ab217b655f0ff43d07d1bdbd43b8f3e8f","0xad7568924ec1f8419869971a70d8e0355c1682fafa560f5ecb1c80d9f171036f"],"worker":"alphagruis"}

--- thread ID: 0x1f8c, 2021.07.31 15:32:06.840, PCIe: 00000000:06:00.0, GPU.06 share accepted.

>>> thread ID: 0x1f8c, 2021.07.31 15:32:06.840, 3017 ms (22 ms)
{"id":1025,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1ae8, 2021.07.31 15:32:07.086, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 0).
 nonce: 0x498d02a39ad14f6f
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000520d8ad5386f135ebb7158a9dbb3e550a4bc9cfdee4e344f0e7f01d9
   mix: 0x30b537f1ecd4d33b276c4a824eb6c5412b08d8f7aab692422a28065794335c9c

<<< thread ID: 0x1140, 2021.07.31 15:32:07.086, 0 ms
{"jsonrpc":"2.0","id":1026,"method":"eth_submitWork","params":["0x498d02a39ad14f6f","0xf471192744f13d9b608c6aec0090e76ab217b655f0ff43d07d1bdbd43b8f3e8f","0x30b537f1ecd4d33b276c4a824eb6c5412b08d8f7aab692422a28065794335c9c"],"worker":"alphagruis"}

--- thread ID: 0x182c, 2021.07.31 15:32:07.109, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:32:07.109, 269 ms (22 ms)
{"id":1026,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x8d8, 2021.07.31 15:32:08.136, 1026 ms
{"id":0,"jsonrpc":"2.0","result":["0xba2f26efed1f2c5edd8ab74463e3a822e4e761daec5d346c37bb854dffbc0e11","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffce"]}

--- thread ID: 0x8d8, 2021.07.31 15:32:08.136
epoch = 220 (next epoch in 21778 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2324, 2021.07.31 15:32:09.123, 987 ms
{"id":0,"jsonrpc":"2.0","result":["0x2b16deb94486514b6231bc73ae1ae4fa7cf4c07c7b3716e090a696372463deb3","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffcf"]}

--- thread ID: 0x2324, 2021.07.31 15:32:09.123
epoch = 220 (next epoch in 21777 blocks), share difficulty = 4 GH.

>>> thread ID: 0xe6c, 2021.07.31 15:32:12.806, 3683 ms
{"id":0,"jsonrpc":"2.0","result":["0xb95440b8303e33117e0369f4d5b0232ba959c4ee2f91cf29b04180ac9cc170af","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd0"]}

--- thread ID: 0xe6c, 2021.07.31 15:32:12.806
epoch = 220 (next epoch in 21776 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2100, 2021.07.31 15:32:12.820, 13 ms
{"id":0,"jsonrpc":"2.0","result":["0x811eaa519679bd2c4293375ca9441a824eadb537ab1182becad0bd7ab504b6f7","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd0"]}

--- thread ID: 0x2100, 2021.07.31 15:32:12.820
epoch = 220 (next epoch in 21776 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1fe0, 2021.07.31 15:32:16.793, 3972 ms
{"id":0,"jsonrpc":"2.0","result":["0x9a83825f03ca3be8bef9303374854be95fa1525e5b6a0d107c320e19dfc3ec3b","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd0"]}

--- thread ID: 0x1fe0, 2021.07.31 15:32:16.793
epoch = 220 (next epoch in 21776 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:32:18.111, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:04:48.611)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:04:52.777, 22 ms], [fan = 75%, 1742 rpm, 59°C], 30.551721 MH/s (109.04 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:01:15.771, 13 ms], [fan = 75%, 1760 rpm, 60°C], 30.560333 MH/s (111.11 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:02:09.640,  0 ms], [fan = 75%, 1730 rpm, 65°C], 30.554364 MH/s (109.39 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:02:11.578,  0 ms], [fan = 75%, 1736 rpm, 59°C], 30.562511 MH/s (109.72 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:02:13.692,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.566827 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 4, S = 0, R = 0, I = 0], [00:00:11.294,  0 ms], [fan = 75%, 1706 rpm, 62°C], 30.531125 MH/s (109.36 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:04:52.777,  0 ms], [fan = 75%, 1715 rpm, 59°C], 30.533563 MH/s (108.44 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:03:29.697,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.534298 MH/s (108.31 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:04:52.777,  0 ms], [fan = 75%, 1737 rpm, 67°C], 30.540533 MH/s (109.54 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 3, S = 0, R = 0, I = 0], [00:01:08.067,  0 ms], [fan = 75%, 1734 rpm, 65°C], 30.523712 MH/s (109.09 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 6, S = 0, R = 0, I = 0], [00:00:11.025,  0 ms], [fan = 75%, 1719 rpm, 60°C], 30.532745 MH/s (109.90 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:00:16.199,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.542052 MH/s (110.75 W) = 366.533784 MH/s (1314.55 W)

<<< thread ID: 0x1e74, 2021.07.31 15:32:18.286, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8dc98","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1f8c, 2021.07.31 15:32:18.306, 1513 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1140, 2021.07.31 15:32:20.220, 1913 ms
{"id":0,"jsonrpc":"2.0","result":["0x25bd87548b00f2efce11fc03eb82219aaffa19c74e18c85bd5a561102dbaf36a","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd1"]}

--- thread ID: 0x1140, 2021.07.31 15:32:20.220
epoch = 220 (next epoch in 21775 blocks), share difficulty = 4 GH.

>>> thread ID: 0x182c, 2021.07.31 15:32:20.298, 77 ms
{"id":0,"jsonrpc":"2.0","result":["0x25bd87548b00f2efce11fc03eb82219aaffa19c74e18c85bd5a561102dbaf36a","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd1"]}

--- thread ID: 0x182c, 2021.07.31 15:32:20.298
epoch = 220 (next epoch in 21775 blocks), share difficulty = 4 GH.

>>> thread ID: 0x8d8, 2021.07.31 15:32:24.493, 4195 ms
{"id":0,"jsonrpc":"2.0","result":["0xb987394efc0d69a746367ae4af070b2a0db00249ac33f0e329dc3651516d7d77","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd1"]}

--- thread ID: 0x8d8, 2021.07.31 15:32:24.493
epoch = 220 (next epoch in 21775 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2324, 2021.07.31 15:32:28.217, 3723 ms
{"id":0,"jsonrpc":"2.0","result":["0xd6e2da6846e9f3c644fc23c0912667f7fe9a9aaf8cffc00c3f52dbc40be53fe8","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd1"]}

--- thread ID: 0x2324, 2021.07.31 15:32:28.217
epoch = 220 (next epoch in 21775 blocks), share difficulty = 4 GH.

>>> thread ID: 0xe6c, 2021.07.31 15:32:29.874, 1657 ms
{"id":0,"jsonrpc":"2.0","result":["0x40bf7e923a2b174e0c53ffefabe769bcbdbb9c422c77ceae5101617f7fa6f7f1","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd2"]}

--- thread ID: 0xe6c, 2021.07.31 15:32:29.875
epoch = 220 (next epoch in 21774 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2100, 2021.07.31 15:32:29.928, 53 ms
{"id":0,"jsonrpc":"2.0","result":["0x40bf7e923a2b174e0c53ffefabe769bcbdbb9c422c77ceae5101617f7fa6f7f1","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd2"]}

--- thread ID: 0x2100, 2021.07.31 15:32:29.928
epoch = 220 (next epoch in 21774 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:32:33.299, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:05:03.799)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:05:07.965, 24 ms], [fan = 75%, 1711 rpm, 59°C], 30.571194 MH/s (110.61 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:01:30.959,  0 ms], [fan = 75%, 1725 rpm, 60°C], 30.527827 MH/s (108.87 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:02:24.827,  0 ms], [fan = 75%, 1724 rpm, 65°C], 30.560950 MH/s (107.56 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:02:26.766,  0 ms], [fan = 75%, 1724 rpm, 59°C], 30.562975 MH/s (110.50 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:02:28.879,  0 ms], [fan = 75%, 1714 rpm, 62°C], 30.564661 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 4, S = 0, R = 0, I = 0], [00:00:26.482,  0 ms], [fan = 75%, 1717 rpm, 62°C], 30.528111 MH/s (111.03 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:05:07.965,  0 ms], [fan = 75%, 1720 rpm, 59°C], 30.539888 MH/s (111.24 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:03:44.885,  0 ms], [fan = 75%, 1728 rpm, 59°C], 30.523176 MH/s (112.25 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:05:07.965,  0 ms], [fan = 75%, 1729 rpm, 67°C], 30.540035 MH/s (110.42 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 3, S = 0, R = 0, I = 0], [00:01:23.254,  0 ms], [fan = 75%, 1717 rpm, 64°C], 30.517143 MH/s (109.67 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 6, S = 0, R = 0, I = 0], [00:00:26.212,  0 ms], [fan = 75%, 1726 rpm, 60°C], 30.505733 MH/s (110.66 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:00:31.386,  0 ms], [fan = 75%, 1726 rpm, 64°C], 30.527010 MH/s (109.63 W) = 366.468703 MH/s (1322.32 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:32:33.463, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d7de5f","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:32:33.738, 3809 ms (275 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1f8c, 2021.07.31 15:32:33.829, 90 ms
{"id":0,"jsonrpc":"2.0","result":["0xbd171eca1b2c2e1772a52014cce86af2a2004a15da4bd236aa92cf165ff5f9c3","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd2"]}

--- thread ID: 0x1f8c, 2021.07.31 15:32:33.829
epoch = 220 (next epoch in 21774 blocks), share difficulty = 4 GH.

--- thread ID: 0x120c, 2021.07.31 15:32:36.255, PCIe: 00000000:06:00.0, GPU.06 share found (search channel 1).
 nonce: 0x498d02a618145738
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000000600751c142e81856e1e26b315bedac7e7e941350f2bb3e7d09b5f66
   mix: 0xac0302f31f145c7b00e856c4d83a91b63b02e923a09020687227bc55a4b5687f

<<< thread ID: 0x1140, 2021.07.31 15:32:36.255, 0 ms
{"jsonrpc":"2.0","id":1027,"method":"eth_submitWork","params":["0x498d02a618145738","0xbd171eca1b2c2e1772a52014cce86af2a2004a15da4bd236aa92cf165ff5f9c3","0xac0302f31f145c7b00e856c4d83a91b63b02e923a09020687227bc55a4b5687f"],"worker":"alphagruis"}

--- thread ID: 0x182c, 2021.07.31 15:32:36.276, PCIe: 00000000:06:00.0, GPU.06 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:32:36.276, 2447 ms (21 ms)
{"id":1027,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x8d8, 2021.07.31 15:32:37.859, 1582 ms
{"id":0,"jsonrpc":"2.0","result":["0xde4c43b49e2b6915b7e04f37bcb0979d0d04d9b9e98d74b32384d2c0075b46a8","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd2"]}

--- thread ID: 0x8d8, 2021.07.31 15:32:37.859
epoch = 220 (next epoch in 21774 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2324, 2021.07.31 15:32:41.857, 3998 ms
{"id":0,"jsonrpc":"2.0","result":["0x8da4a5e9790d1d1da54c93e58de8ef2dd8ae69716922bdf735c9e0b38d44aab7","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd2"]}

--- thread ID: 0x2324, 2021.07.31 15:32:41.857
epoch = 220 (next epoch in 21774 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:32:48.476, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:05:18.976)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:05:23.142, 19 ms], [fan = 75%, 1719 rpm, 59°C], 30.580287 MH/s (109.06 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:01:46.136, 50 ms], [fan = 75%, 1723 rpm, 60°C], 30.550140 MH/s (108.05 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:02:40.004,  0 ms], [fan = 75%, 1732 rpm, 65°C], 30.564177 MH/s (110.58 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:02:41.943,  0 ms], [fan = 75%, 1727 rpm, 59°C], 30.570325 MH/s (109.48 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:02:44.056,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.565387 MH/s (109.79 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 5, S = 0, R = 0, I = 0], [00:00:12.221,  0 ms], [fan = 75%, 1740 rpm, 62°C], 30.549839 MH/s (109.19 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:05:23.142,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.555776 MH/s (108.83 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:04:00.062,  0 ms], [fan = 75%, 1717 rpm, 59°C], 30.553506 MH/s (111.05 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 0, S = 0, R = 0, I = 0], [00:05:23.142,  0 ms], [fan = 75%, 1719 rpm, 67°C], 30.537306 MH/s (110.47 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 3, S = 0, R = 0, I = 0], [00:01:38.431,  0 ms], [fan = 75%, 1722 rpm, 64°C], 30.512572 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 6, S = 0, R = 0, I = 0], [00:00:41.389,  0 ms], [fan = 75%, 1729 rpm, 60°C], 30.513046 MH/s (109.20 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:00:46.563,  0 ms], [fan = 75%, 1724 rpm, 64°C], 30.548636 MH/s (109.72 W) = 366.600997 MH/s (1315.07 W)

<<< thread ID: 0xe6c, 2021.07.31 15:32:48.603, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9e325","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2100, 2021.07.31 15:32:48.626, 6768 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1aa8, 2021.07.31 15:32:49.614, PCIe: 00000000:0c:00.0, GPU.09 share found (search channel 1).
 nonce: 0x498d02a73c039a8f
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000004783409fee158f0c018a1b47039b99bb11bf00825186762fd9b92764
   mix: 0x00e1facb627d1ba2f8a90694ac83e0a6c87225e4c5e048e20e97efad7b769826

<<< thread ID: 0x1fe0, 2021.07.31 15:32:49.614, 0 ms
{"jsonrpc":"2.0","id":1028,"method":"eth_submitWork","params":["0x498d02a73c039a8f","0x8da4a5e9790d1d1da54c93e58de8ef2dd8ae69716922bdf735c9e0b38d44aab7","0x00e1facb627d1ba2f8a90694ac83e0a6c87225e4c5e048e20e97efad7b769826"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:32:49.636, PCIe: 00000000:0c:00.0, GPU.09 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:32:49.636, 1009 ms (21 ms)
{"id":1028,"jsonrpc":"2.0","result":true}

--- thread ID: 0xd20, 2021.07.31 15:32:53.196, PCIe: 00000000:0d:00.0, GPU.10 share found (search channel 1).
 nonce: 0x498d02a78a42fbc7
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000008a24ff42fcb6560f25fa94eee4d132dab97af8b988d4d05558bd5259
   mix: 0xae9c98393b1945e4a70aafb2ea5ec827d91aba68479d465db3ac148d9880734b

<<< thread ID: 0x1f8c, 2021.07.31 15:32:53.196, 0 ms
{"jsonrpc":"2.0","id":1029,"method":"eth_submitWork","params":["0x498d02a78a42fbc7","0x8da4a5e9790d1d1da54c93e58de8ef2dd8ae69716922bdf735c9e0b38d44aab7","0xae9c98393b1945e4a70aafb2ea5ec827d91aba68479d465db3ac148d9880734b"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:32:53.219, PCIe: 00000000:0d:00.0, GPU.10 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:32:53.219, 3583 ms (23 ms)
{"id":1029,"jsonrpc":"2.0","result":true}

--- thread ID: 0xd20, 2021.07.31 15:32:59.046, PCIe: 00000000:0d:00.0, GPU.10 share found (search channel 0).
 nonce: 0x498d02a80a0df335
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000010d85f8853cc3a4683d8ae3a1923763fe7c110c0b1f065ac52a71e411
   mix: 0x88f783bbf0c2594f662493d1e0875b0ef0af7f6eb238b639dd32994fa74372c8

<<< thread ID: 0x182c, 2021.07.31 15:32:59.046, 0 ms
{"jsonrpc":"2.0","id":1030,"method":"eth_submitWork","params":["0x498d02a80a0df335","0x8da4a5e9790d1d1da54c93e58de8ef2dd8ae69716922bdf735c9e0b38d44aab7","0x88f783bbf0c2594f662493d1e0875b0ef0af7f6eb238b639dd32994fa74372c8"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:32:59.069, PCIe: 00000000:0d:00.0, GPU.10 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:32:59.069, 5849 ms (22 ms)
{"id":1030,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:33:03.611, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:05:34.111)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:05:38.277, 42 ms], [fan = 75%, 1726 rpm, 59°C], 30.580791 MH/s (109.04 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:02:01.271, 61 ms], [fan = 75%, 1723 rpm, 60°C], 30.555790 MH/s (108.30 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:02:55.139,  0 ms], [fan = 75%, 1714 rpm, 65°C], 30.560102 MH/s (109.16 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:02:57.078,  3 ms], [fan = 75%, 1719 rpm, 59°C], 30.571223 MH/s (109.45 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:02:59.191,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.558537 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 5, S = 0, R = 0, I = 0], [00:00:27.356,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.545922 MH/s (109.09 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:05:38.277,  0 ms], [fan = 75%, 1739 rpm, 59°C], 30.555894 MH/s (108.61 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:04:15.197,  0 ms], [fan = 75%, 1737 rpm, 59°C], 30.553600 MH/s (111.32 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 1, S = 0, R = 0, I = 0], [00:00:13.997,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.549210 MH/s (109.18 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:00:04.565,  0 ms], [fan = 75%, 1728 rpm, 65°C], 30.515568 MH/s (109.02 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 6, S = 0, R = 0, I = 0], [00:00:56.524,  0 ms], [fan = 75%, 1716 rpm, 60°C], 30.516125 MH/s (109.55 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:01:01.698,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.543610 MH/s (110.77 W) = 366.606372 MH/s (1313.38 W)

<<< thread ID: 0x2324, 2021.07.31 15:33:03.769, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9f824","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:33:03.792, 4722 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:33:18.783, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:05:49.283)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:05:53.449, 34 ms], [fan = 75%, 1716 rpm, 59°C], 30.578400 MH/s (109.01 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:02:16.443, 34 ms], [fan = 75%, 1707 rpm, 60°C], 30.540521 MH/s (109.46 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:03:10.311, 34 ms], [fan = 75%, 1719 rpm, 65°C], 30.539147 MH/s (107.91 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:03:12.250,  0 ms], [fan = 75%, 1719 rpm, 58°C], 30.573989 MH/s (110.27 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:03:14.363,  0 ms], [fan = 75%, 1717 rpm, 62°C], 30.566898 MH/s (109.46 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 5, S = 0, R = 0, I = 0], [00:00:42.528,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.543271 MH/s (111.14 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:05:53.449,  0 ms], [fan = 75%, 1717 rpm, 59°C], 30.557105 MH/s (110.93 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:04:30.369,  0 ms], [fan = 75%, 1720 rpm, 59°C], 30.550195 MH/s (110.33 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 1, S = 0, R = 0, I = 0], [00:00:29.169,  0 ms], [fan = 75%, 1706 rpm, 67°C], 30.548338 MH/s (110.53 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:00:19.737,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.521755 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 6, S = 0, R = 0, I = 0], [00:01:11.696,  0 ms], [fan = 75%, 1746 rpm, 60°C], 30.522683 MH/s (109.96 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:01:16.870,  0 ms], [fan = 75%, 1718 rpm, 64°C], 30.548829 MH/s (109.72 W) = 366.591131 MH/s (1318.38 W)

<<< thread ID: 0x2100, 2021.07.31 15:33:18.932, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9bc9b","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1fe0, 2021.07.31 15:33:18.955, 15163 ms (23 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:33:33.952, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:06:04.452)
PCIe: 00000000:01:00.0, GPU.01: [A = 0, S = 0, R = 0, I = 0], [00:06:08.618, 20 ms], [fan = 75%, 1721 rpm, 59°C], 30.573087 MH/s (108.96 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:02:31.612,  0 ms], [fan = 75%, 1712 rpm, 60°C], 30.526159 MH/s (111.02 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:03:25.481,  0 ms], [fan = 75%, 1719 rpm, 65°C], 30.524671 MH/s (107.82 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:03:27.419,  0 ms], [fan = 75%, 1724 rpm, 58°C], 30.569959 MH/s (110.08 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:03:29.533,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.562083 MH/s (109.46 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 5, S = 0, R = 0, I = 0], [00:00:57.697,  0 ms], [fan = 75%, 1749 rpm, 62°C], 30.525960 MH/s (110.22 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:06:08.618,  0 ms], [fan = 75%, 1731 rpm, 59°C], 30.553598 MH/s (108.19 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:04:45.538,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.546566 MH/s (110.89 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 1, S = 0, R = 0, I = 0], [00:00:44.338,  0 ms], [fan = 75%, 1721 rpm, 67°C], 30.542912 MH/s (109.57 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:00:34.906,  0 ms], [fan = 75%, 1725 rpm, 65°C], 30.516927 MH/s (109.48 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 6, S = 0, R = 0, I = 0], [00:01:26.866,  0 ms], [fan = 75%, 1730 rpm, 60°C], 30.546121 MH/s (110.75 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:01:32.040,  0 ms], [fan = 75%, 1735 rpm, 64°C], 30.518373 MH/s (109.63 W) = 366.506416 MH/s (1316.10 W)

<<< thread ID: 0x1e74, 2021.07.31 15:33:34.129, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d871b0","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

--- thread ID: 0x7d4, 2021.07.31 15:33:34.206, PCIe: 00000000:01:00.0, GPU.01 share found (search channel 1).
 nonce: 0x498d02ab0a74f833
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000ac88001e52529193bcfcf130bdc4e0efe95570c32943b5bece3f0b94
   mix: 0xc32984f42195da898d69420000c64394bd25f22e530d58d8b2a8adf10b15d7e7

<<< thread ID: 0x1f8c, 2021.07.31 15:33:34.206, 0 ms
{"jsonrpc":"2.0","id":1031,"method":"eth_submitWork","params":["0x498d02ab0a74f833","0x8da4a5e9790d1d1da54c93e58de8ef2dd8ae69716922bdf735c9e0b38d44aab7","0xc32984f42195da898d69420000c64394bd25f22e530d58d8b2a8adf10b15d7e7"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:33:34.411, 15455 ms (282 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x182c, 2021.07.31 15:33:34.432, PCIe: 00000000:01:00.0, GPU.01 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:33:34.432, 20 ms (225 ms)
{"id":1031,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x8d8, 2021.07.31 15:33:39.793, 5361 ms
{"id":0,"jsonrpc":"2.0","result":["0xfd50749a6a4b8c97b9ad00f3f6832a03db6dfef20e8b8ebf2865955d8ef93f9d","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd3"]}

--- thread ID: 0x8d8, 2021.07.31 15:33:39.793
epoch = 220 (next epoch in 21773 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2324, 2021.07.31 15:33:43.783, 3990 ms
{"id":0,"jsonrpc":"2.0","result":["0x73f77dffe6e5a7a4e8174759716d63e09f3ac4f1aa5b2656c6925ff218d3c1c9","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd3"]}

--- thread ID: 0x2324, 2021.07.31 15:33:43.783
epoch = 220 (next epoch in 21773 blocks), share difficulty = 4 GH.

--- thread ID: 0x120c, 2021.07.31 15:33:49.022, PCIe: 00000000:06:00.0, GPU.06 share found (search channel 0).
 nonce: 0x498d02ac4e05b982
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000010376abe22ea7ec03752faf937e7a6ad90318c37f169e9a797dc5c866
   mix: 0xa7153f9679f7993d80dc18c8dfda3de530dcf54d4e5f10cde6c8c6b3077e2e4a

<<< thread ID: 0xe6c, 2021.07.31 15:33:49.022, 0 ms
{"jsonrpc":"2.0","id":1032,"method":"eth_submitWork","params":["0x498d02ac4e05b982","0x73f77dffe6e5a7a4e8174759716d63e09f3ac4f1aa5b2656c6925ff218d3c1c9","0xa7153f9679f7993d80dc18c8dfda3de530dcf54d4e5f10cde6c8c6b3077e2e4a"],"worker":"alphagruis"}

--- thread ID: 0x1eb4, 2021.07.31 15:33:49.143, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:06:19.643)
PCIe: 00000000:01:00.0, GPU.01: [A = 1, S = 0, R = 0, I = 0], [00:00:14.936, 27 ms], [fan = 75%, 1737 rpm, 59°C], 30.574837 MH/s (109.01 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:02:46.802,  0 ms], [fan = 75%, 1747 rpm, 60°C], 30.528461 MH/s (110.91 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:03:40.671,  0 ms], [fan = 75%, 1730 rpm, 65°C], 30.527181 MH/s (109.64 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:03:42.610,  0 ms], [fan = 75%, 1733 rpm, 58°C], 30.571201 MH/s (110.27 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:03:44.723,  0 ms], [fan = 75%, 1722 rpm, 62°C], 30.560901 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 5, S = 0, R = 0, I = 0], [00:00:00.120,  0 ms], [fan = 75%, 1743 rpm, 62°C], 30.527991 MH/s (108.50 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:06:23.808,  0 ms], [fan = 75%, 1720 rpm, 60°C], 30.556207 MH/s (110.60 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:05:00.728,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.551949 MH/s (109.20 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 1, S = 0, R = 0, I = 0], [00:00:59.529,  0 ms], [fan = 75%, 1732 rpm, 67°C], 30.545663 MH/s (109.41 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:00:50.097,  0 ms], [fan = 75%, 1725 rpm, 65°C], 30.516125 MH/s (109.34 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 6, S = 0, R = 0, I = 0], [00:01:42.056,  0 ms], [fan = 75%, 1724 rpm, 60°C], 30.545902 MH/s (108.91 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:01:47.230,  0 ms], [fan = 75%, 1724 rpm, 64°C], 30.516919 MH/s (109.39 W) = 366.523337 MH/s (1315.06 W)

<<< thread ID: 0x2100, 2021.07.31 15:33:49.365, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8b3c9","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

--- thread ID: 0x1ae8, 2021.07.31 15:33:49.402, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 0).
 nonce: 0x498d02ac56683015
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000c9ccf83f0369395c4e66f42718b06727ed3d5c4e6be42a13db7182a1
   mix: 0xee8df9ea44f0cb4e1d6607e74db634f5cc917dcf4ede089711678e30a40a1642

<<< thread ID: 0x1fe0, 2021.07.31 15:33:49.402, 0 ms
{"jsonrpc":"2.0","id":1033,"method":"eth_submitWork","params":["0x498d02ac56683015","0x73f77dffe6e5a7a4e8174759716d63e09f3ac4f1aa5b2656c6925ff218d3c1c9","0xee8df9ea44f0cb4e1d6607e74db634f5cc917dcf4ede089711678e30a40a1642"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:33:50.090, PCIe: 00000000:06:00.0, GPU.06 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:33:50.090, 6306 ms (1067 ms)
{"id":1032,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1f8c, 2021.07.31 15:33:50.090, 0 ms (724 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1140, 2021.07.31 15:33:50.110, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:33:50.110, 20 ms (707 ms)
{"id":1033,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x182c, 2021.07.31 15:33:58.339, 8229 ms
{"id":0,"jsonrpc":"2.0","result":["0xff72a8c1f6b98fa4f709830e377cf19e9dae5312b9893d4b4ab42b4a0928583a","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd4"]}

--- thread ID: 0x182c, 2021.07.31 15:33:58.340
epoch = 220 (next epoch in 21772 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:34:04.378, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:06:34.879)
PCIe: 00000000:01:00.0, GPU.01: [A = 1, S = 0, R = 0, I = 0], [00:00:30.172, 11 ms], [fan = 75%, 1740 rpm, 59°C], 30.574167 MH/s (109.01 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:03:02.038, 11 ms], [fan = 75%, 1723 rpm, 60°C], 30.523669 MH/s (110.22 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:03:55.907, 13 ms], [fan = 75%, 1730 rpm, 65°C], 30.529938 MH/s (109.85 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:03:57.845,  0 ms], [fan = 75%, 1722 rpm, 58°C], 30.568137 MH/s (110.27 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:03:59.959,  0 ms], [fan = 75%, 1714 rpm, 62°C], 30.565708 MH/s (109.04 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:00:15.356,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.525918 MH/s (109.11 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:06:39.044,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.539405 MH/s (108.68 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:05:15.964,  0 ms], [fan = 75%, 1717 rpm, 60°C], 30.550927 MH/s (109.54 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 1, S = 0, R = 0, I = 0], [00:01:14.765,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.518298 MH/s (109.37 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:01:05.332,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.541841 MH/s (111.26 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:00:14.976,  0 ms], [fan = 75%, 1721 rpm, 60°C], 30.544017 MH/s (109.64 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:02:02.466,  0 ms], [fan = 75%, 1710 rpm, 64°C], 30.541410 MH/s (109.72 W) = 366.523435 MH/s (1315.72 W)

<<< thread ID: 0x8d8, 2021.07.31 15:34:04.588, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8b42b","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2324, 2021.07.31 15:34:04.611, 6271 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0xe6c, 2021.07.31 15:34:04.982, 371 ms
{"id":0,"jsonrpc":"2.0","result":["0xf0196336948df6259d5835ef7ca24658f9bbacbdc1e2af2e9fead315ebd4721c","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd5"]}

--- thread ID: 0xe6c, 2021.07.31 15:34:04.982
epoch = 220 (next epoch in 21771 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2100, 2021.07.31 15:34:06.531, 1548 ms
{"id":0,"jsonrpc":"2.0","result":["0xacbcf3c6f13eefcabb23e9ec9164c6e6d4b63c5eee828641997e3dcab42e139c","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd6"]}

--- thread ID: 0x2100, 2021.07.31 15:34:06.531
epoch = 220 (next epoch in 21770 blocks), share difficulty = 4 GH.

--- thread ID: 0x1aa8, 2021.07.31 15:34:14.545, PCIe: 00000000:0c:00.0, GPU.09 share found (search channel 0).
 nonce: 0x498d02ae7beed8dc
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000576efcd3658c750f44be099b78bcd6ede7d9a3a1df5b0e6ab67ed2df
   mix: 0x812f224cbfa22eb5d48ab52609a3835d6d941132d1e2d30c6dfcf47b37acb724

<<< thread ID: 0x1fe0, 2021.07.31 15:34:14.545, 0 ms
{"jsonrpc":"2.0","id":1034,"method":"eth_submitWork","params":["0x498d02ae7beed8dc","0xacbcf3c6f13eefcabb23e9ec9164c6e6d4b63c5eee828641997e3dcab42e139c","0x812f224cbfa22eb5d48ab52609a3835d6d941132d1e2d30c6dfcf47b37acb724"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:34:14.566, PCIe: 00000000:0c:00.0, GPU.09 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:34:14.566, 8035 ms (21 ms)
{"id":1034,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:34:19.605, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:06:50.105)
PCIe: 00000000:01:00.0, GPU.01: [A = 1, S = 0, R = 0, I = 0], [00:00:45.399, 55 ms], [fan = 75%, 1734 rpm, 59°C], 30.573656 MH/s (109.25 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:03:17.265, 44 ms], [fan = 75%, 1739 rpm, 60°C], 30.550290 MH/s (109.68 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:04:11.134,  0 ms], [fan = 75%, 1752 rpm, 65°C], 30.547182 MH/s (109.39 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 2, S = 0, R = 0, I = 0], [00:04:13.072,  4 ms], [fan = 75%, 1719 rpm, 58°C], 30.569103 MH/s (110.49 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:04:15.185,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.556646 MH/s (109.55 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:00:30.583,  0 ms], [fan = 75%, 1734 rpm, 62°C], 30.550292 MH/s (109.36 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 0, S = 0, R = 0, I = 0], [00:06:54.271,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.552777 MH/s (108.68 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:05:31.191,  0 ms], [fan = 75%, 1731 rpm, 59°C], 30.551808 MH/s (109.27 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 2, S = 0, R = 0, I = 0], [00:00:05.060,  0 ms], [fan = 75%, 1734 rpm, 67°C], 30.539240 MH/s (108.35 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:01:20.559,  0 ms], [fan = 75%, 1736 rpm, 65°C], 30.530917 MH/s (109.02 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:00:30.203,  0 ms], [fan = 75%, 1706 rpm, 60°C], 30.544417 MH/s (109.85 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 4, S = 0, R = 0, I = 0], [00:02:17.692,  0 ms], [fan = 75%, 1735 rpm, 64°C], 30.526068 MH/s (109.63 W) = 366.592396 MH/s (1312.53 W)

<<< thread ID: 0x1f8c, 2021.07.31 15:34:19.731, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9c18c","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:34:19.753, 5186 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x182c, 2021.07.31 15:34:20.501, 748 ms
{"id":0,"jsonrpc":"2.0","result":["0xc7e5a713a86d4b6b7838742c423e47f2475a8c00ef3bf85a2e4cd37b9b4f58a8","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd7"]}

--- thread ID: 0x182c, 2021.07.31 15:34:20.501
epoch = 220 (next epoch in 21769 blocks), share difficulty = 4 GH.

--- thread ID: 0x2aac, 2021.07.31 15:34:21.002, PCIe: 00000000:0f:00.0, GPU.12 share found (search channel 0).
 nonce: 0x498d02af089232dc
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000a7fca0b409491a15ffeb268353d4c4b0edc9aa741b02047eba69b71f
   mix: 0xb5ae4c66b8e4bff49fcbd7021bc755b3e68d4da9b8d18fe2df0e87aa9ecdfee5

<<< thread ID: 0x8d8, 2021.07.31 15:34:21.002, 0 ms
{"jsonrpc":"2.0","id":1035,"method":"eth_submitWork","params":["0x498d02af089232dc","0xc7e5a713a86d4b6b7838742c423e47f2475a8c00ef3bf85a2e4cd37b9b4f58a8","0xb5ae4c66b8e4bff49fcbd7021bc755b3e68d4da9b8d18fe2df0e87aa9ecdfee5"],"worker":"alphagruis"}

--- thread ID: 0x2324, 2021.07.31 15:34:21.024, PCIe: 00000000:0f:00.0, GPU.12 share accepted.

>>> thread ID: 0x2324, 2021.07.31 15:34:21.024, 523 ms (21 ms)
{"id":1035,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2b98, 2021.07.31 15:34:28.360, PCIe: 00000000:09:00.0, GPU.07 share found (search channel 0).
 nonce: 0x498d02afa94340cb
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000a3950bda5dfd778225140b72cf906baf91c65acf2ec6246e2c4f50ab
   mix: 0x0fbe4c9ae015cb5172e866e69ba71d47e6352709407c6336e7fffb06889d6792

<<< thread ID: 0xe6c, 2021.07.31 15:34:28.360, 0 ms
{"jsonrpc":"2.0","id":1036,"method":"eth_submitWork","params":["0x498d02afa94340cb","0xc7e5a713a86d4b6b7838742c423e47f2475a8c00ef3bf85a2e4cd37b9b4f58a8","0x0fbe4c9ae015cb5172e866e69ba71d47e6352709407c6336e7fffb06889d6792"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:34:28.382, PCIe: 00000000:09:00.0, GPU.07 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:34:28.382, 7357 ms (21 ms)
{"id":1036,"jsonrpc":"2.0","result":true}

--- thread ID: 0x20d8, 2021.07.31 15:34:32.036, PCIe: 00000000:04:00.0, GPU.04 share found (search channel 1).
 nonce: 0x498d02aff9f6fdb0
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000b54e3b9578c8bf30e67e6787ee29300c844403ff600f4e0c9febe394
   mix: 0x0c8c70fe807a7a9fca4f7bc27452061662a7cfa239b14cbf5ce190de2bdfa5bd

<<< thread ID: 0x1fe0, 2021.07.31 15:34:32.036, 0 ms
{"jsonrpc":"2.0","id":1037,"method":"eth_submitWork","params":["0x498d02aff9f6fdb0","0xc7e5a713a86d4b6b7838742c423e47f2475a8c00ef3bf85a2e4cd37b9b4f58a8","0x0c8c70fe807a7a9fca4f7bc27452061662a7cfa239b14cbf5ce190de2bdfa5bd"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:34:32.058, PCIe: 00000000:04:00.0, GPU.04 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:34:32.058, 3675 ms (21 ms)
{"id":1037,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:34:34.736, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:07:05.236)
PCIe: 00000000:01:00.0, GPU.01: [A = 1, S = 0, R = 0, I = 0], [00:01:00.530,  4 ms], [fan = 75%, 1734 rpm, 59°C], 30.577120 MH/s (108.71 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:03:32.396, 49 ms], [fan = 75%, 1717 rpm, 60°C], 30.560902 MH/s (109.12 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:04:26.265,  0 ms], [fan = 75%, 1727 rpm, 65°C], 30.562982 MH/s (107.80 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 3, S = 0, R = 0, I = 0], [00:00:02.700, 20 ms], [fan = 75%, 1719 rpm, 58°C], 30.569838 MH/s (110.00 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:04:30.316,  0 ms], [fan = 75%, 1731 rpm, 62°C], 30.560443 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:00:45.714,  0 ms], [fan = 75%, 1726 rpm, 62°C], 30.508849 MH/s (111.14 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 1, S = 0, R = 0, I = 0], [00:00:06.376,  0 ms], [fan = 75%, 1734 rpm, 60°C], 30.550758 MH/s (110.93 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:05:46.322,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.535579 MH/s (110.61 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 2, S = 0, R = 0, I = 0], [00:00:20.191,  0 ms], [fan = 75%, 1734 rpm, 67°C], 30.511039 MH/s (110.41 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:01:35.690,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.508152 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:00:45.334,  0 ms], [fan = 75%, 1720 rpm, 60°C], 30.546627 MH/s (109.97 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 5, S = 0, R = 0, I = 0], [00:00:13.734,  0 ms], [fan = 75%, 1735 rpm, 64°C], 30.528417 MH/s (111.30 W) = 366.520706 MH/s (1319.51 W)

<<< thread ID: 0x1f8c, 2021.07.31 15:34:34.948, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8a982","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:34:34.969, 2911 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1aa8, 2021.07.31 15:34:48.678, PCIe: 00000000:0c:00.0, GPU.09 share found (search channel 1).
 nonce: 0x498d02b165cf0630
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000008e8b42c8f2cfb854c4de0dbed753a684463837ffffbc1b7f025f9b76
   mix: 0x988f2d291475ef66225c64bbc2932aff154b15f7660b7a7361bfe063901a5a1a

<<< thread ID: 0x182c, 2021.07.31 15:34:48.679, 0 ms
{"jsonrpc":"2.0","id":1038,"method":"eth_submitWork","params":["0x498d02b165cf0630","0xc7e5a713a86d4b6b7838742c423e47f2475a8c00ef3bf85a2e4cd37b9b4f58a8","0x988f2d291475ef66225c64bbc2932aff154b15f7660b7a7361bfe063901a5a1a"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:34:48.700, PCIe: 00000000:0c:00.0, GPU.09 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:34:48.700, 13730 ms (21 ms)
{"id":1038,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:34:49.940, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:07:20.440)
PCIe: 00000000:01:00.0, GPU.01: [A = 1, S = 0, R = 0, I = 0], [00:01:15.733, 25 ms], [fan = 75%, 1708 rpm, 59°C], 30.572850 MH/s (109.25 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:03:47.600,  0 ms], [fan = 75%, 1744 rpm, 60°C], 30.540001 MH/s (108.94 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:04:41.468,  2 ms], [fan = 75%, 1732 rpm, 65°C], 30.563289 MH/s (107.89 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 3, S = 0, R = 0, I = 0], [00:00:17.904,  0 ms], [fan = 75%, 1730 rpm, 58°C], 30.561614 MH/s (110.49 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:04:45.520,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.567710 MH/s (109.69 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:01:00.918,  0 ms], [fan = 75%, 1734 rpm, 62°C], 30.508988 MH/s (111.95 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 1, S = 0, R = 0, I = 0], [00:00:21.580,  0 ms], [fan = 75%, 1715 rpm, 59°C], 30.539671 MH/s (108.61 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:06:01.526,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.550552 MH/s (111.45 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 3, S = 0, R = 0, I = 0], [00:00:01.261,  0 ms], [fan = 75%, 1729 rpm, 67°C], 30.509624 MH/s (108.58 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:01:50.894,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.508474 MH/s (109.58 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:01:00.538,  0 ms], [fan = 75%, 1734 rpm, 60°C], 30.536867 MH/s (109.90 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 5, S = 0, R = 0, I = 0], [00:00:28.938,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.542399 MH/s (110.50 W) = 366.502039 MH/s (1316.83 W)

<<< thread ID: 0x2324, 2021.07.31 15:34:50.184, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d86097","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:34:50.206, 1506 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2100, 2021.07.31 15:34:51.593, 1386 ms
{"id":0,"jsonrpc":"2.0","result":["0x373cbf45802450d985e8ab7e5b60de31223c4de93e5360a1d2b92fec650213be","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd8"]}

--- thread ID: 0x2100, 2021.07.31 15:34:51.593
epoch = 220 (next epoch in 21768 blocks), share difficulty = 4 GH.

--- thread ID: 0x2b98, 2021.07.31 15:34:58.963, PCIe: 00000000:09:00.0, GPU.07 share found (search channel 0).
 nonce: 0x498d02b245f12c23
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000010a4440317ba19601262b171927562dc3ff0323b89f2a330e8cbd1d91
   mix: 0x8682f4d789166bd06d8d16975543a8cc6fbd8ad864e61d02aac570587ab5aa19

<<< thread ID: 0x1fe0, 2021.07.31 15:34:58.964, 0 ms
{"jsonrpc":"2.0","id":1039,"method":"eth_submitWork","params":["0x498d02b245f12c23","0x373cbf45802450d985e8ab7e5b60de31223c4de93e5360a1d2b92fec650213be","0x8682f4d789166bd06d8d16975543a8cc6fbd8ad864e61d02aac570587ab5aa19"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:34:58.986, PCIe: 00000000:09:00.0, GPU.07 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:34:58.986, 7392 ms (22 ms)
{"id":1039,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:35:05.204, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:07:35.704)
PCIe: 00000000:01:00.0, GPU.01: [A = 1, S = 0, R = 0, I = 0], [00:01:30.998, 40 ms], [fan = 75%, 1711 rpm, 59°C], 30.582985 MH/s (109.16 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:04:02.864, 53 ms], [fan = 75%, 1694 rpm, 60°C], 30.551620 MH/s (110.44 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:04:56.733,  9 ms], [fan = 75%, 1735 rpm, 65°C], 30.564283 MH/s (108.04 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 3, S = 0, R = 0, I = 0], [00:00:33.168,  0 ms], [fan = 75%, 1719 rpm, 58°C], 30.577042 MH/s (109.43 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:05:00.784,  3 ms], [fan = 75%, 1725 rpm, 62°C], 30.563662 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:01:16.182,  0 ms], [fan = 75%, 1731 rpm, 62°C], 30.514805 MH/s (110.71 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 2, S = 0, R = 0, I = 0], [00:00:06.241,  0 ms], [fan = 75%, 1726 rpm, 59°C], 30.552074 MH/s (109.16 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:06:16.790,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.560635 MH/s (109.27 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 3, S = 0, R = 0, I = 0], [00:00:16.526,  0 ms], [fan = 75%, 1713 rpm, 67°C], 30.505922 MH/s (109.53 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:02:06.158,  0 ms], [fan = 75%, 1719 rpm, 65°C], 30.506089 MH/s (111.40 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:01:15.802,  0 ms], [fan = 75%, 1726 rpm, 60°C], 30.505727 MH/s (110.22 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 5, S = 0, R = 0, I = 0], [00:00:44.202,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.550932 MH/s (111.20 W) = 366.535776 MH/s (1318.43 W)

<<< thread ID: 0x1f8c, 2021.07.31 15:35:05.425, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8e460","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:35:05.447, 6461 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x182c, 2021.07.31 15:35:07.849, 2402 ms
{"id":0,"jsonrpc":"2.0","result":["0xb49fede27c21a55a3dd3b6be5d6141c36b19153af5f49a00e179fc29f220f73a","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffd9"]}

--- thread ID: 0x182c, 2021.07.31 15:35:07.850
epoch = 220 (next epoch in 21767 blocks), share difficulty = 4 GH.

>>> thread ID: 0x8d8, 2021.07.31 15:35:17.642, 9792 ms
{"id":0,"jsonrpc":"2.0","result":["0xb9413fa5e8e11abdd00e4d8b49aaab7d0984b1d390860b43caff52e58b58c6aa","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffda"]}

--- thread ID: 0x8d8, 2021.07.31 15:35:17.642
epoch = 220 (next epoch in 21766 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:35:20.439, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:07:50.939)
PCIe: 00000000:01:00.0, GPU.01: [A = 1, S = 0, R = 0, I = 0], [00:01:46.233, 25 ms], [fan = 75%, 1734 rpm, 59°C], 30.573342 MH/s (109.04 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:04:18.099, 18 ms], [fan = 75%, 1752 rpm, 60°C], 30.538606 MH/s (110.91 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 2, S = 0, R = 0, I = 0], [00:05:11.968,  0 ms], [fan = 75%, 1746 rpm, 66°C], 30.564750 MH/s (107.82 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 3, S = 0, R = 0, I = 0], [00:00:48.403,  0 ms], [fan = 75%, 1736 rpm, 59°C], 30.567041 MH/s (109.14 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:05:16.020,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.565556 MH/s (109.40 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:01:31.417,  0 ms], [fan = 75%, 1712 rpm, 62°C], 30.554091 MH/s (110.24 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 2, S = 0, R = 0, I = 0], [00:00:21.476,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.538591 MH/s (108.43 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:06:32.025,  0 ms], [fan = 75%, 1725 rpm, 60°C], 30.548120 MH/s (109.11 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 3, S = 0, R = 0, I = 0], [00:00:31.761,  0 ms], [fan = 75%, 1732 rpm, 67°C], 30.521792 MH/s (109.66 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:02:21.393,  0 ms], [fan = 75%, 1728 rpm, 65°C], 30.521970 MH/s (109.42 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:01:31.037,  0 ms], [fan = 75%, 1718 rpm, 60°C], 30.545493 MH/s (109.66 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 5, S = 0, R = 0, I = 0], [00:00:59.437,  0 ms], [fan = 75%, 1718 rpm, 64°C], 30.544859 MH/s (108.32 W) = 366.584211 MH/s (1311.14 W)

<<< thread ID: 0x2324, 2021.07.31 15:35:20.639, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9a193","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:35:20.660, 3017 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xa50, 2021.07.31 15:35:28.836, PCIe: 00000000:03:00.0, GPU.03 share found (search channel 0).
 nonce: 0x498d02b4d2b4ac84
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000b11103d6a13ba77ad35282d8b461427dd027902d152b21890f22b6a9
   mix: 0x5618de326c484c63655813d5d08c316efcb17ed292938f76e680f0f077a3d38a

<<< thread ID: 0x2100, 2021.07.31 15:35:28.836, 0 ms
{"jsonrpc":"2.0","id":1040,"method":"eth_submitWork","params":["0x498d02b4d2b4ac84","0xb9413fa5e8e11abdd00e4d8b49aaab7d0984b1d390860b43caff52e58b58c6aa","0x5618de326c484c63655813d5d08c316efcb17ed292938f76e680f0f077a3d38a"],"worker":"alphagruis"}

--- thread ID: 0x1fe0, 2021.07.31 15:35:28.859, PCIe: 00000000:03:00.0, GPU.03 share accepted.

>>> thread ID: 0x1fe0, 2021.07.31 15:35:28.859, 8199 ms (23 ms)
{"id":1040,"jsonrpc":"2.0","result":true}

--- thread ID: 0x7d4, 2021.07.31 15:35:30.513, PCIe: 00000000:01:00.0, GPU.01 share found (search channel 1).
 nonce: 0x498d02b4f779ff76
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000a3526a6ffa241b7b4d92b57031d385680f94880e43151831ce6e8fbf
   mix: 0x51eda1778d4c2d0062e5f8bfc0a4867836aebba731177688d46b3f4484658c6c

<<< thread ID: 0x1e74, 2021.07.31 15:35:30.513, 0 ms
{"jsonrpc":"2.0","id":1041,"method":"eth_submitWork","params":["0x498d02b4f779ff76","0xb9413fa5e8e11abdd00e4d8b49aaab7d0984b1d390860b43caff52e58b58c6aa","0x51eda1778d4c2d0062e5f8bfc0a4867836aebba731177688d46b3f4484658c6c"],"worker":"alphagruis"}

--- thread ID: 0x1f8c, 2021.07.31 15:35:30.538, PCIe: 00000000:01:00.0, GPU.01 share accepted.

>>> thread ID: 0x1f8c, 2021.07.31 15:35:30.538, 1679 ms (25 ms)
{"id":1041,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2b98, 2021.07.31 15:35:33.352, PCIe: 00000000:09:00.0, GPU.07 share found (search channel 0).
 nonce: 0x498d02b53523bc42
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000026adfb64a5ba9679d7e87598e1bf51911c1194e466bdc654669c2ecd
   mix: 0x74dd61d227725b6e45969536d7dc3cfe8293990d6a077e94fc03de0b41346794

<<< thread ID: 0x1140, 2021.07.31 15:35:33.352, 0 ms
{"jsonrpc":"2.0","id":1042,"method":"eth_submitWork","params":["0x498d02b53523bc42","0xb9413fa5e8e11abdd00e4d8b49aaab7d0984b1d390860b43caff52e58b58c6aa","0x74dd61d227725b6e45969536d7dc3cfe8293990d6a077e94fc03de0b41346794"],"worker":"alphagruis"}

--- thread ID: 0x182c, 2021.07.31 15:35:33.374, PCIe: 00000000:09:00.0, GPU.07 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:35:33.374, 2835 ms (22 ms)
{"id":1042,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:35:35.642, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:08:06.142)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:00:05.129, 43 ms], [fan = 75%, 1719 rpm, 59°C], 30.564238 MH/s (109.25 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:04:33.302, 21 ms], [fan = 75%, 1720 rpm, 60°C], 30.530508 MH/s (109.41 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 3, S = 0, R = 0, I = 0], [00:00:06.807,  2 ms], [fan = 75%, 1711 rpm, 65°C], 30.563458 MH/s (111.31 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 3, S = 0, R = 0, I = 0], [00:01:03.606,  0 ms], [fan = 75%, 1727 rpm, 59°C], 30.564449 MH/s (110.12 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:05:31.222,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.562343 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:01:46.620,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.553978 MH/s (109.36 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 3, S = 0, R = 0, I = 0], [00:00:02.290,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.532443 MH/s (108.47 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:06:47.228,  0 ms], [fan = 75%, 1728 rpm, 60°C], 30.518475 MH/s (111.32 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 3, S = 0, R = 0, I = 0], [00:00:46.964,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.514356 MH/s (108.40 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:02:36.596,  0 ms], [fan = 75%, 1725 rpm, 65°C], 30.515031 MH/s (108.93 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:01:46.240,  0 ms], [fan = 75%, 1714 rpm, 60°C], 30.544542 MH/s (110.82 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 5, S = 0, R = 0, I = 0], [00:01:14.640,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.542050 MH/s (109.39 W) = 366.505871 MH/s (1316.64 W)

<<< thread ID: 0x8d8, 2021.07.31 15:35:35.803, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d86f8f","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2324, 2021.07.31 15:35:35.825, 2451 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0xe6c, 2021.07.31 15:35:39.178, 3352 ms
{"id":0,"jsonrpc":"2.0","result":["0xc724cfcd7dca3c66c298c8fceed64f00696fbf51bae43c5dfee66f9bbd356159","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffdb"]}

--- thread ID: 0xe6c, 2021.07.31 15:35:39.178
epoch = 220 (next epoch in 21765 blocks), share difficulty = 4 GH.

--- thread ID: 0x1aa8, 2021.07.31 15:35:47.328, PCIe: 00000000:0c:00.0, GPU.09 share found (search channel 1).
 nonce: 0x498d02b667112cc0
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000303129a6a1e97aab39ade6fb8047912b173f17ebb391322b6811763d
   mix: 0xeface2ed54492fded71251868a43b371dee52970f6ba424ccee89832ade9dfc2

<<< thread ID: 0x2100, 2021.07.31 15:35:47.328, 0 ms
{"jsonrpc":"2.0","id":1043,"method":"eth_submitWork","params":["0x498d02b667112cc0","0xc724cfcd7dca3c66c298c8fceed64f00696fbf51bae43c5dfee66f9bbd356159","0xeface2ed54492fded71251868a43b371dee52970f6ba424ccee89832ade9dfc2"],"worker":"alphagruis"}

--- thread ID: 0x1fe0, 2021.07.31 15:35:47.351, PCIe: 00000000:0c:00.0, GPU.09 share accepted.

>>> thread ID: 0x1fe0, 2021.07.31 15:35:47.351, 8173 ms (23 ms)
{"id":1043,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:35:50.809, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:08:21.309)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:00:20.296, 28 ms], [fan = 75%, 1708 rpm, 59°C], 30.577321 MH/s (109.16 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:04:48.469,  0 ms], [fan = 75%, 1707 rpm, 60°C], 30.556917 MH/s (109.08 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 3, S = 0, R = 0, I = 0], [00:00:21.974,  0 ms], [fan = 75%, 1724 rpm, 66°C], 30.555241 MH/s (110.98 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 3, S = 0, R = 0, I = 0], [00:01:18.773, 25 ms], [fan = 75%, 1724 rpm, 59°C], 30.570514 MH/s (108.94 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:05:46.390,  0 ms], [fan = 75%, 1722 rpm, 62°C], 30.560753 MH/s (109.83 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:02:01.787,  0 ms], [fan = 75%, 1717 rpm, 62°C], 30.554814 MH/s (109.44 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 3, S = 0, R = 0, I = 0], [00:00:17.457,  0 ms], [fan = 75%, 1712 rpm, 60°C], 30.535984 MH/s (111.00 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:07:02.395,  0 ms], [fan = 75%, 1725 rpm, 60°C], 30.540279 MH/s (109.27 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:00:03.481,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.501655 MH/s (109.13 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:02:51.763,  0 ms], [fan = 75%, 1717 rpm, 65°C], 30.501157 MH/s (109.56 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:02:01.407,  0 ms], [fan = 75%, 1731 rpm, 61°C], 30.548573 MH/s (109.67 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 5, S = 0, R = 0, I = 0], [00:01:29.807,  0 ms], [fan = 75%, 1727 rpm, 64°C], 30.501436 MH/s (110.69 W) = 366.504644 MH/s (1316.74 W)

<<< thread ID: 0x1e74, 2021.07.31 15:35:51.002, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d86ac4","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1f8c, 2021.07.31 15:35:51.022, 3670 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1140, 2021.07.31 15:35:52.115, 1092 ms
{"id":0,"jsonrpc":"2.0","result":["0x1cd6723c391678b6c35fbd9fdd76162fe859481a183558b30e7f6a609bc9b9ff","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffdc"]}

--- thread ID: 0x1140, 2021.07.31 15:35:52.115
epoch = 220 (next epoch in 21764 blocks), share difficulty = 4 GH.

>>> thread ID: 0x182c, 2021.07.31 15:35:53.547, 1431 ms
{"id":0,"jsonrpc":"2.0","result":["0xfd6043ec6d8a306b192b377ded04b5cbf55942df78eee1351617259c20d0d637","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffdd"]}

--- thread ID: 0x182c, 2021.07.31 15:35:53.547
epoch = 220 (next epoch in 21763 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:36:06.005, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:08:36.506)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:00:35.493, 44 ms], [fan = 75%, 1726 rpm, 59°C], 30.580563 MH/s (109.01 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:05:03.665,  0 ms], [fan = 75%, 1738 rpm, 60°C], 30.560998 MH/s (109.68 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 3, S = 0, R = 0, I = 0], [00:00:37.170,  0 ms], [fan = 75%, 1730 rpm, 66°C], 30.555672 MH/s (109.64 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 3, S = 0, R = 0, I = 0], [00:01:33.970,  0 ms], [fan = 75%, 1727 rpm, 59°C], 30.572713 MH/s (109.67 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:06:01.586,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.564583 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:02:16.983,  0 ms], [fan = 75%, 1726 rpm, 62°C], 30.511401 MH/s (109.02 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 3, S = 0, R = 0, I = 0], [00:00:32.654,  0 ms], [fan = 75%, 1712 rpm, 60°C], 30.536507 MH/s (107.52 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:07:17.591,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.536546 MH/s (110.28 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:00:18.677,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.508826 MH/s (109.75 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:03:06.960,  0 ms], [fan = 75%, 1725 rpm, 65°C], 30.509544 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:02:16.603,  0 ms], [fan = 75%, 1712 rpm, 61°C], 30.551210 MH/s (108.75 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 5, S = 0, R = 0, I = 0], [00:01:45.003,  0 ms], [fan = 75%, 1730 rpm, 64°C], 30.546389 MH/s (109.49 W) = 366.534952 MH/s (1312.34 W)

<<< thread ID: 0x8d8, 2021.07.31 15:36:06.157, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8e128","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2324, 2021.07.31 15:36:06.178, 12631 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2aac, 2021.07.31 15:36:13.469, PCIe: 00000000:0f:00.0, GPU.12 share found (search channel 1).
 nonce: 0x498d02b8a1f6115b
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000002358076e5a3c53cc1bae13e7e41b4e127fc309ad027111dd50d6a681
   mix: 0xc13666e3e2a6bc04cbf69c923660f42612dafc973e4d9f4a8a5699a97c81c9da

<<< thread ID: 0xe6c, 2021.07.31 15:36:13.469, 0 ms
{"jsonrpc":"2.0","id":1044,"method":"eth_submitWork","params":["0x498d02b8a1f6115b","0xfd6043ec6d8a306b192b377ded04b5cbf55942df78eee1351617259c20d0d637","0xc13666e3e2a6bc04cbf69c923660f42612dafc973e4d9f4a8a5699a97c81c9da"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:36:13.745, PCIe: 00000000:0f:00.0, GPU.12 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:36:13.745, 7566 ms (276 ms)
{"id":1044,"jsonrpc":"2.0","result":true}

--- thread ID: 0x20d8, 2021.07.31 15:36:18.474, PCIe: 00000000:04:00.0, GPU.04 share found (search channel 1).
 nonce: 0x498d02b90f44550f
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000aafa8b603a58db686b1602d3ae714321fe75eb8b8764979a62c2cdf8
   mix: 0x2494b379f24a1c2489355bc35bdd598a403c4a7b56fd7d45f971ea12c2ab6f7b

<<< thread ID: 0x1fe0, 2021.07.31 15:36:18.475, 0 ms
{"jsonrpc":"2.0","id":1045,"method":"eth_submitWork","params":["0x498d02b90f44550f","0xfd6043ec6d8a306b192b377ded04b5cbf55942df78eee1351617259c20d0d637","0x2494b379f24a1c2489355bc35bdd598a403c4a7b56fd7d45f971ea12c2ab6f7b"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:36:18.495, PCIe: 00000000:04:00.0, GPU.04 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:36:18.495, 4749 ms (20 ms)
{"id":1045,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:36:21.173, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:08:51.674)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:00:50.660, 25 ms], [fan = 75%, 1711 rpm, 59°C], 30.571769 MH/s (109.25 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:05:18.833,  0 ms], [fan = 75%, 1720 rpm, 60°C], 30.545276 MH/s (109.08 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 3, S = 0, R = 0, I = 0], [00:00:52.338,  0 ms], [fan = 75%, 1743 rpm, 66°C], 30.551692 MH/s (109.55 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:00:02.699,  0 ms], [fan = 75%, 1722 rpm, 59°C], 30.567602 MH/s (109.65 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:06:16.754,  0 ms], [fan = 75%, 1731 rpm, 62°C], 30.551508 MH/s (109.79 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:02:32.151,  0 ms], [fan = 75%, 1731 rpm, 62°C], 30.553639 MH/s (109.34 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 3, S = 0, R = 0, I = 0], [00:00:47.821,  0 ms], [fan = 75%, 1729 rpm, 59°C], 30.535222 MH/s (108.37 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 1, S = 0, R = 0, I = 0], [00:07:32.759,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.534844 MH/s (107.73 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:00:33.845,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.506954 MH/s (107.67 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:03:22.127,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.507144 MH/s (111.42 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:02:31.771,  0 ms], [fan = 75%, 1724 rpm, 60°C], 30.509356 MH/s (110.06 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:00:07.704,  0 ms], [fan = 75%, 1718 rpm, 64°C], 30.542653 MH/s (109.72 W) = 366.477659 MH/s (1311.62 W)

<<< thread ID: 0x1f8c, 2021.07.31 15:36:21.426, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8015b","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:36:21.448, 2952 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xf60, 2021.07.31 15:36:30.791, PCIe: 00000000:0a:00.0, GPU.08 share found (search channel 1).
 nonce: 0x498d02ba1c4a45df
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000b5bec9e804cb196a583c52b667d42db9531a473a484e197b518abc31
   mix: 0x5cf13cf6ef5835ec9bcf088826f8d263776a28826cf5557c204a83091e65a8d3

<<< thread ID: 0x182c, 2021.07.31 15:36:30.791, 0 ms
{"jsonrpc":"2.0","id":1046,"method":"eth_submitWork","params":["0x498d02ba1c4a45df","0xfd6043ec6d8a306b192b377ded04b5cbf55942df78eee1351617259c20d0d637","0x5cf13cf6ef5835ec9bcf088826f8d263776a28826cf5557c204a83091e65a8d3"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:36:30.812, PCIe: 00000000:0a:00.0, GPU.08 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:36:30.812, 9364 ms (21 ms)
{"id":1046,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:36:36.439, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:09:06.939)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:01:05.926, 33 ms], [fan = 75%, 1708 rpm, 59°C], 30.564349 MH/s (109.04 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:05:34.099, 32 ms], [fan = 75%, 1733 rpm, 60°C], 30.530681 MH/s (111.25 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 3, S = 0, R = 0, I = 0], [00:01:07.604, 30 ms], [fan = 75%, 1735 rpm, 66°C], 30.558858 MH/s (108.98 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:00:17.965,  0 ms], [fan = 75%, 1733 rpm, 59°C], 30.566624 MH/s (110.29 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:06:32.020,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.562996 MH/s (110.07 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:02:47.417,  0 ms], [fan = 75%, 1726 rpm, 62°C], 30.557295 MH/s (111.14 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 3, S = 0, R = 0, I = 0], [00:01:03.087,  0 ms], [fan = 75%, 1726 rpm, 59°C], 30.540003 MH/s (108.01 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:00:05.648,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.541227 MH/s (107.40 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:00:49.111,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.523054 MH/s (109.43 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:03:37.393,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.517395 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:02:47.037,  0 ms], [fan = 75%, 1722 rpm, 61°C], 30.517533 MH/s (109.96 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:00:22.970,  0 ms], [fan = 75%, 1724 rpm, 64°C], 30.545196 MH/s (109.63 W) = 366.525211 MH/s (1314.86 W)

<<< thread ID: 0x2324, 2021.07.31 15:36:36.671, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8bb1b","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:36:36.693, 5880 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2100, 2021.07.31 15:36:42.426, 5733 ms
{"id":0,"jsonrpc":"2.0","result":["0xa2c84db1ffe6360e6f11151168a8a3d2d02b65517067c4d2217ad159bcf0fda0","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffde"]}

--- thread ID: 0x2100, 2021.07.31 15:36:42.426
epoch = 220 (next epoch in 21762 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1fe0, 2021.07.31 15:36:47.305, 4879 ms
{"id":0,"jsonrpc":"2.0","result":["0x1c6f9151bae33fddefefe4857c122e0499005a85e6249a3cb13ac4459a415a1c","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffdf"]}

--- thread ID: 0x1fe0, 2021.07.31 15:36:47.305
epoch = 220 (next epoch in 21761 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1e74, 2021.07.31 15:36:51.619, 4313 ms
{"id":0,"jsonrpc":"2.0","result":["0x6e0af6ec0cb7b383e473d72e7a616e587722eb3a1e6ab4dfe8074b2f8350f4a2","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe0"]}

--- thread ID: 0x1e74, 2021.07.31 15:36:51.619
epoch = 220 (next epoch in 21760 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:36:51.674, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:09:22.174)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:01:21.161, 17 ms], [fan = 75%, 1719 rpm, 59°C], 30.575831 MH/s (110.26 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:05:49.334,  5 ms], [fan = 75%, 1731 rpm, 60°C], 30.553041 MH/s (109.20 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 3, S = 0, R = 0, I = 0], [00:01:22.839,  5 ms], [fan = 75%, 1727 rpm, 66°C], 30.554094 MH/s (111.55 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:00:33.200,  5 ms], [fan = 75%, 1719 rpm, 59°C], 30.552473 MH/s (109.66 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:06:47.254,  5 ms], [fan = 75%, 1720 rpm, 62°C], 30.551429 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:03:02.652,  0 ms], [fan = 75%, 1731 rpm, 62°C], 30.545205 MH/s (111.09 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 3, S = 0, R = 0, I = 0], [00:01:18.322,  0 ms], [fan = 75%, 1709 rpm, 60°C], 30.533640 MH/s (111.30 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:00:20.883,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.534258 MH/s (109.51 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:01:04.346,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.548261 MH/s (110.13 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:03:52.628,  0 ms], [fan = 75%, 1711 rpm, 65°C], 30.521055 MH/s (109.09 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:03:02.272,  0 ms], [fan = 75%, 1727 rpm, 61°C], 30.520715 MH/s (110.28 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:00:38.205,  0 ms], [fan = 75%, 1732 rpm, 64°C], 30.539259 MH/s (109.72 W) = 366.529261 MH/s (1321.67 W)

<<< thread ID: 0x1f8c, 2021.07.31 15:36:51.815, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8caed","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:36:51.837, 217 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x182c, 2021.07.31 15:36:55.583, 3745 ms
{"id":0,"jsonrpc":"2.0","result":["0x5c3a07831bcf6e597299d3d0210a1ebfc6e0d3577935ada45d2427b49ece93da","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe1"]}

--- thread ID: 0x182c, 2021.07.31 15:36:55.583
epoch = 220 (next epoch in 21759 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:37:06.827, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:09:37.328)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:01:36.314, 58 ms], [fan = 75%, 1727 rpm, 59°C], 30.577831 MH/s (109.27 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:06:04.487, 31 ms], [fan = 75%, 1744 rpm, 60°C], 30.548978 MH/s (109.41 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 3, S = 0, R = 0, I = 0], [00:01:37.992, 34 ms], [fan = 75%, 1716 rpm, 66°C], 30.561862 MH/s (108.04 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:00:48.353, 41 ms], [fan = 75%, 1730 rpm, 59°C], 30.572038 MH/s (109.27 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:07:02.408, 32 ms], [fan = 75%, 1733 rpm, 62°C], 30.552671 MH/s (108.99 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:03:17.805,  0 ms], [fan = 75%, 1726 rpm, 62°C], 30.528167 MH/s (109.36 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 3, S = 0, R = 0, I = 0], [00:01:33.475,  0 ms], [fan = 75%, 1720 rpm, 60°C], 30.535451 MH/s (111.44 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:00:36.037,  0 ms], [fan = 75%, 1731 rpm, 59°C], 30.540008 MH/s (108.48 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:01:19.499,  0 ms], [fan = 75%, 1729 rpm, 67°C], 30.551343 MH/s (110.53 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:04:07.782,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.521669 MH/s (108.83 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:03:17.425,  0 ms], [fan = 75%, 1718 rpm, 61°C], 30.521904 MH/s (110.03 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:00:53.358,  0 ms], [fan = 75%, 1727 rpm, 64°C], 30.542781 MH/s (109.63 W) = 366.554703 MH/s (1313.29 W)

<<< thread ID: 0x8d8, 2021.07.31 15:37:07.002, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d92e4f","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2324, 2021.07.31 15:37:07.024, 11441 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2b98, 2021.07.31 15:37:07.453, PCIe: 00000000:09:00.0, GPU.07 share found (search channel 1).
 nonce: 0x498d02bd3d3132ef
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000006c8e46a8dda0efc53077a5c2261dcc681d232118db7c3dfedc111d14
   mix: 0xb79f71dfe011c51e1a3bf0d6bd8848c7f45d9b10f3c0e557352270592e2cf6b9

<<< thread ID: 0xe6c, 2021.07.31 15:37:07.453, 0 ms
{"jsonrpc":"2.0","id":1047,"method":"eth_submitWork","params":["0x498d02bd3d3132ef","0x5c3a07831bcf6e597299d3d0210a1ebfc6e0d3577935ada45d2427b49ece93da","0xb79f71dfe011c51e1a3bf0d6bd8848c7f45d9b10f3c0e557352270592e2cf6b9"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:37:07.475, PCIe: 00000000:09:00.0, GPU.07 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:37:07.475, 450 ms (21 ms)
{"id":1047,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1fe0, 2021.07.31 15:37:08.155, 679 ms
{"id":0,"jsonrpc":"2.0","result":["0xf92a4bf551e12589e1adff7d63899b1b6ddbe4b194d13d28b85ff7a28cb800e8","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe2"]}

--- thread ID: 0x1fe0, 2021.07.31 15:37:08.155
epoch = 220 (next epoch in 21758 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:37:22.020, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:09:52.520)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:01:51.507, 66 ms], [fan = 75%, 1721 rpm, 60°C], 30.574943 MH/s (110.16 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:06:19.680, 34 ms], [fan = 75%, 1720 rpm, 60°C], 30.562768 MH/s (110.59 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 3, S = 0, R = 0, I = 0], [00:01:53.184,  0 ms], [fan = 75%, 1714 rpm, 66°C], 30.558415 MH/s (109.31 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:01:03.545,  0 ms], [fan = 75%, 1724 rpm, 59°C], 30.572028 MH/s (110.74 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:07:17.600,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.564626 MH/s (109.84 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:03:32.998,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.540005 MH/s (109.09 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 4, S = 0, R = 0, I = 0], [00:00:14.566,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.534078 MH/s (108.44 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:00:51.229,  0 ms], [fan = 75%, 1728 rpm, 60°C], 30.533928 MH/s (111.26 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:01:34.691,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.544464 MH/s (109.77 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:04:22.974,  0 ms], [fan = 75%, 1731 rpm, 65°C], 30.543467 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:03:32.618,  0 ms], [fan = 75%, 1714 rpm, 61°C], 30.544391 MH/s (109.96 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:01:08.551,  0 ms], [fan = 75%, 1718 rpm, 64°C], 30.539846 MH/s (109.97 W) = 366.612959 MH/s (1318.80 W)

<<< thread ID: 0x1e74, 2021.07.31 15:37:22.238, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da11df","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1f8c, 2021.07.31 15:37:22.269, 14114 ms (30 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1140, 2021.07.31 15:37:24.173, 1904 ms
{"id":0,"jsonrpc":"2.0","result":["0x3151c2ef480cf1de3513b9a1b4e728b7a65afb8c6640bba1857d0cae39ecd312","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe2"]}

--- thread ID: 0x1140, 2021.07.31 15:37:24.173
epoch = 220 (next epoch in 21758 blocks), share difficulty = 4 GH.

>>> thread ID: 0x182c, 2021.07.31 15:37:28.210, 4037 ms
{"id":0,"jsonrpc":"2.0","result":["0xd778e1efd01b58747047c0c7a0251aa9401d48348341e3d9365f2b106eb678b4","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe3"]}

--- thread ID: 0x182c, 2021.07.31 15:37:28.210
epoch = 220 (next epoch in 21757 blocks), share difficulty = 4 GH.

>>> thread ID: 0x8d8, 2021.07.31 15:37:28.211, 0 ms
{"id":0,"jsonrpc":"2.0","result":["0x9f488d9fbd511412b7c14d303baadbc3bb5bc5e98c19cf9874f906ae0dec75b7","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe3"]}

--- thread ID: 0x8d8, 2021.07.31 15:37:28.211
epoch = 220 (next epoch in 21757 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2324, 2021.07.31 15:37:29.057, 846 ms
{"id":0,"jsonrpc":"2.0","result":["0x16dc60817b9aacb09f6b02a51f1beb8bc65a2a0483a6bd8dd8963aae99263b37","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe4"]}

--- thread ID: 0x2324, 2021.07.31 15:37:29.057
epoch = 220 (next epoch in 21756 blocks), share difficulty = 4 GH.

--- thread ID: 0xa50, 2021.07.31 15:37:34.493, PCIe: 00000000:03:00.0, GPU.03 share found (search channel 0).
 nonce: 0x498d02bf8c3cd23e
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000015f6c6deeb21ae21c9fb15b5c1b6969d37f1b67037967e06d610a94f
   mix: 0x38fd0d7d12fa34b009cb607d29b6bbab92702448e9db45b43525e6c1a53dae97

<<< thread ID: 0xe6c, 2021.07.31 15:37:34.493, 0 ms
{"jsonrpc":"2.0","id":1048,"method":"eth_submitWork","params":["0x498d02bf8c3cd23e","0x16dc60817b9aacb09f6b02a51f1beb8bc65a2a0483a6bd8dd8963aae99263b37","0x38fd0d7d12fa34b009cb607d29b6bbab92702448e9db45b43525e6c1a53dae97"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:37:34.515, PCIe: 00000000:03:00.0, GPU.03 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:37:34.515, 5457 ms (21 ms)
{"id":1048,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:37:37.251, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:10:07.752)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:02:06.738, 46 ms], [fan = 75%, 1732 rpm, 60°C], 30.574357 MH/s (111.57 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 3, S = 0, R = 0, I = 0], [00:06:34.911,  6 ms], [fan = 75%, 1752 rpm, 60°C], 30.553102 MH/s (110.91 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:00:02.758,  9 ms], [fan = 75%, 1719 rpm, 66°C], 30.560095 MH/s (111.87 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:01:18.777, 27 ms], [fan = 75%, 1722 rpm, 59°C], 30.569600 MH/s (109.78 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:07:32.832,  6 ms], [fan = 75%, 1722 rpm, 62°C], 30.549901 MH/s (109.84 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:03:48.229, 11 ms], [fan = 75%, 1723 rpm, 62°C], 30.539770 MH/s (108.78 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 4, S = 0, R = 0, I = 0], [00:00:29.798,  0 ms], [fan = 75%, 1712 rpm, 60°C], 30.529641 MH/s (108.69 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:01:06.461,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.549766 MH/s (107.73 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:01:49.923,  0 ms], [fan = 75%, 1732 rpm, 67°C], 30.544456 MH/s (110.39 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:04:38.205,  0 ms], [fan = 75%, 1731 rpm, 65°C], 30.512599 MH/s (110.35 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:03:47.849,  0 ms], [fan = 75%, 1730 rpm, 61°C], 30.511994 MH/s (110.68 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:01:23.782,  0 ms], [fan = 75%, 1732 rpm, 64°C], 30.537360 MH/s (111.07 W) = 366.532641 MH/s (1321.67 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:37:37.434, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d8d821","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:37:38.503, 3988 ms (1069 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xee0, 2021.07.31 15:37:46.871, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 1).
 nonce: 0x498d02c09a576055
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000225023ca07d0f20fb320cb281dd17e1fe7c1ec3e772c8a025986caa0
   mix: 0xb045d7feed52babd7c580a03a5494c2e2d52e4acb9f643b34896be10610ec339

<<< thread ID: 0x1f8c, 2021.07.31 15:37:46.871, 0 ms
{"jsonrpc":"2.0","id":1049,"method":"eth_submitWork","params":["0x498d02c09a576055","0x16dc60817b9aacb09f6b02a51f1beb8bc65a2a0483a6bd8dd8963aae99263b37","0xb045d7feed52babd7c580a03a5494c2e2d52e4acb9f643b34896be10610ec339"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:37:46.892, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:37:46.892, 8389 ms (21 ms)
{"id":1049,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2b98, 2021.07.31 15:37:47.556, PCIe: 00000000:09:00.0, GPU.07 share found (search channel 1).
 nonce: 0x498d02c0a8f71f7f
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000063c86fa79a476773e87b9351c03faddf9311024022b7f4c3ba867427
   mix: 0x06c33daa81e818b60f85d951297db8718cb800afcacb726fe91edfa642de6976

<<< thread ID: 0x182c, 2021.07.31 15:37:47.556, 0 ms
{"jsonrpc":"2.0","id":1050,"method":"eth_submitWork","params":["0x498d02c0a8f71f7f","0x16dc60817b9aacb09f6b02a51f1beb8bc65a2a0483a6bd8dd8963aae99263b37","0x06c33daa81e818b60f85d951297db8718cb800afcacb726fe91edfa642de6976"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:37:47.577, PCIe: 00000000:09:00.0, GPU.07 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:37:47.577, 684 ms (20 ms)
{"id":1050,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2324, 2021.07.31 15:37:51.240, 3662 ms
{"id":0,"jsonrpc":"2.0","result":["0x59f540b676606fab67dce5f387b1079252e53cdbb5bcb98ca2d72324eef10b32","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe5"]}

--- thread ID: 0x2324, 2021.07.31 15:37:51.240
epoch = 220 (next epoch in 21755 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:37:52.442, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:10:22.942)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:02:21.929, 54 ms], [fan = 75%, 1742 rpm, 60°C], 30.578966 MH/s (110.95 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:00:05.571,  0 ms], [fan = 75%, 1736 rpm, 60°C], 30.533897 MH/s (111.33 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:00:17.949,  0 ms], [fan = 75%, 1735 rpm, 66°C], 30.541429 MH/s (109.50 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:01:33.967,  0 ms], [fan = 75%, 1719 rpm, 59°C], 30.574042 MH/s (110.41 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 1, S = 0, R = 0, I = 0], [00:07:48.022,  1 ms], [fan = 75%, 1728 rpm, 62°C], 30.545492 MH/s (109.19 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:04:03.419,  0 ms], [fan = 75%, 1743 rpm, 62°C], 30.525117 MH/s (108.93 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 5, S = 0, R = 0, I = 0], [00:00:04.886,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.552934 MH/s (111.42 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:01:21.651,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.549170 MH/s (111.26 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:02:05.113,  0 ms], [fan = 75%, 1732 rpm, 67°C], 30.547458 MH/s (109.63 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 5, S = 0, R = 0, I = 0], [00:04:53.396,  0 ms], [fan = 75%, 1734 rpm, 65°C], 30.528230 MH/s (110.92 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:04:03.040,  0 ms], [fan = 75%, 1720 rpm, 61°C], 30.514653 MH/s (108.23 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:01:38.973,  0 ms], [fan = 75%, 1721 rpm, 64°C], 30.513878 MH/s (109.72 W) = 366.505266 MH/s (1321.50 W)

<<< thread ID: 0xe6c, 2021.07.31 15:37:52.652, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d86d32","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2100, 2021.07.31 15:37:52.673, 1433 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x11d8, 2021.07.31 15:37:57.253, PCIe: 00000000:05:00.0, GPU.05 share found (search channel 1).
 nonce: 0x498d02c17d304a9e
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000d5d8de4eff742d70f362f4becda4a6c7aeaa41ac9ad66fd192c576fc
   mix: 0x219866b63645e1a0036cce1358fbd6f3ea54b6a6418ddd3d6dae7d03a9341cbe

<<< thread ID: 0x1fe0, 2021.07.31 15:37:57.253, 0 ms
{"jsonrpc":"2.0","id":1051,"method":"eth_submitWork","params":["0x498d02c17d304a9e","0x59f540b676606fab67dce5f387b1079252e53cdbb5bcb98ca2d72324eef10b32","0x219866b63645e1a0036cce1358fbd6f3ea54b6a6418ddd3d6dae7d03a9341cbe"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:37:57.277, PCIe: 00000000:05:00.0, GPU.05 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:37:57.277, 4604 ms (23 ms)
{"id":1051,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2b98, 2021.07.31 15:38:01.236, PCIe: 00000000:09:00.0, GPU.07 share found (search channel 1).
 nonce: 0x498d02c1d3f86e3b
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000080d1a69bc8a0a79743f9cd759de28ffe3c8dc63ac9e2aa8a32750d35
   mix: 0x982ae348790f3bd95d342cdb242fcbf6c2e0c9fc4f9117e4103d4a909f46931b

<<< thread ID: 0x1f8c, 2021.07.31 15:38:01.237, 0 ms
{"jsonrpc":"2.0","id":1052,"method":"eth_submitWork","params":["0x498d02c1d3f86e3b","0x59f540b676606fab67dce5f387b1079252e53cdbb5bcb98ca2d72324eef10b32","0x982ae348790f3bd95d342cdb242fcbf6c2e0c9fc4f9117e4103d4a909f46931b"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:38:02.108, PCIe: 00000000:09:00.0, GPU.07 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:38:02.108, 4830 ms (871 ms)
{"id":1052,"jsonrpc":"2.0","result":true}

--- thread ID: 0xd20, 2021.07.31 15:38:02.354, PCIe: 00000000:0d:00.0, GPU.10 share found (search channel 1).
 nonce: 0x498d02c1ecb7b0be
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000d6cbed73b51e47c7db8dd971ffff955b791eab7a91b95f81ee27af57
   mix: 0x6d16b25de7260a89cd3ae03f3bf7675bb335f12e9c35e5776dc4336ced0a5494

<<< thread ID: 0x182c, 2021.07.31 15:38:02.355, 0 ms
{"jsonrpc":"2.0","id":1053,"method":"eth_submitWork","params":["0x498d02c1ecb7b0be","0x59f540b676606fab67dce5f387b1079252e53cdbb5bcb98ca2d72324eef10b32","0x6d16b25de7260a89cd3ae03f3bf7675bb335f12e9c35e5776dc4336ced0a5494"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:38:02.376, PCIe: 00000000:0d:00.0, GPU.10 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:38:02.376, 267 ms (21 ms)
{"id":1053,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:38:07.646, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:10:38.146)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:02:37.133,  7 ms], [fan = 75%, 1729 rpm, 59°C], 30.575628 MH/s (108.96 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:00:20.775,  0 ms], [fan = 75%, 1733 rpm, 60°C], 30.524555 MH/s (109.13 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:00:33.153, 12 ms], [fan = 75%, 1711 rpm, 66°C], 30.555983 MH/s (109.95 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:01:49.171,  0 ms], [fan = 75%, 1736 rpm, 59°C], 30.568473 MH/s (109.77 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:00:10.393,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.556405 MH/s (109.90 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:04:18.623,  0 ms], [fan = 75%, 1734 rpm, 62°C], 30.523817 MH/s (109.11 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 6, S = 0, R = 0, I = 0], [00:00:06.409,  0 ms], [fan = 75%, 1726 rpm, 59°C], 30.553485 MH/s (109.40 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:01:36.855,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.554570 MH/s (110.54 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:02:20.317,  0 ms], [fan = 75%, 1732 rpm, 67°C], 30.534940 MH/s (110.39 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:00:05.291,  0 ms], [fan = 75%, 1734 rpm, 65°C], 30.523629 MH/s (109.16 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:04:18.244,  0 ms], [fan = 75%, 1725 rpm, 61°C], 30.515780 MH/s (107.85 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:01:54.177,  0 ms], [fan = 75%, 1729 rpm, 65°C], 30.515474 MH/s (109.72 W) = 366.502739 MH/s (1313.88 W)

<<< thread ID: 0x2324, 2021.07.31 15:38:07.857, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d86353","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:38:07.879, 5502 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2100, 2021.07.31 15:38:13.663, 5784 ms
{"id":0,"jsonrpc":"2.0","result":["0x0e4e4bb46a4181d640586022c801aafd00c6b93acc11a4d1e34a0134df4d8e7f","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe6"]}

--- thread ID: 0x2100, 2021.07.31 15:38:13.664
epoch = 220 (next epoch in 21754 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1fe0, 2021.07.31 15:38:20.503, 6840 ms
{"id":0,"jsonrpc":"2.0","result":["0x9cf4975cc11f5ce622bfb68182da5c8fc5dbe1f03de6c2736ca00b0f85f1fd76","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe7"]}

--- thread ID: 0x1fe0, 2021.07.31 15:38:20.504
epoch = 220 (next epoch in 21753 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:38:22.877, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:10:53.377)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:02:52.364, 43 ms], [fan = 75%, 1721 rpm, 60°C], 30.533479 MH/s (109.25 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:00:36.006, 21 ms], [fan = 75%, 1712 rpm, 60°C], 30.543580 MH/s (109.39 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:00:48.384, 43 ms], [fan = 75%, 1738 rpm, 66°C], 30.533290 MH/s (110.20 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:02:04.402, 27 ms], [fan = 75%, 1716 rpm, 59°C], 30.569425 MH/s (110.08 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:00:25.624,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.534228 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:04:33.855,  0 ms], [fan = 75%, 1731 rpm, 62°C], 30.543623 MH/s (109.36 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 6, S = 0, R = 0, I = 0], [00:00:21.641,  0 ms], [fan = 75%, 1715 rpm, 60°C], 30.533821 MH/s (109.47 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:01:52.086,  0 ms], [fan = 75%, 1717 rpm, 59°C], 30.533783 MH/s (108.96 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:02:35.548,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.519735 MH/s (108.87 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:00:20.522,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.542073 MH/s (109.74 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:04:33.475,  0 ms], [fan = 75%, 1718 rpm, 61°C], 30.544039 MH/s (106.96 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:02:09.408,  0 ms], [fan = 75%, 1724 rpm, 64°C], 30.519735 MH/s (109.30 W) = 366.450811 MH/s (1311.47 W)

<<< thread ID: 0x1e74, 2021.07.31 15:38:23.097, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d7987b","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1f8c, 2021.07.31 15:38:23.122, 2618 ms (24 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:38:38.107, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:11:08.607)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:03:07.594, 21 ms], [fan = 75%, 1729 rpm, 59°C], 30.577595 MH/s (111.34 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:00:51.236,  0 ms], [fan = 75%, 1728 rpm, 60°C], 30.552509 MH/s (111.35 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:01:03.613, 13 ms], [fan = 75%, 1730 rpm, 66°C], 30.570091 MH/s (109.12 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:02:19.632,  0 ms], [fan = 75%, 1721 rpm, 59°C], 30.571663 MH/s (109.18 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:00:40.854,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.564999 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:04:49.084,  0 ms], [fan = 75%, 1717 rpm, 62°C], 30.552480 MH/s (111.04 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 6, S = 0, R = 0, I = 0], [00:00:36.870,  0 ms], [fan = 75%, 1731 rpm, 59°C], 30.540718 MH/s (111.30 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:02:07.316,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.539827 MH/s (108.77 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:02:50.778,  0 ms], [fan = 75%, 1721 rpm, 67°C], 30.529473 MH/s (110.63 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:00:35.752,  0 ms], [fan = 75%, 1731 rpm, 65°C], 30.548177 MH/s (109.30 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:04:48.704,  0 ms], [fan = 75%, 1717 rpm, 60°C], 30.548080 MH/s (109.67 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:02:24.637,  0 ms], [fan = 75%, 1727 rpm, 64°C], 30.528061 MH/s (110.91 W) = 366.623673 MH/s (1322.50 W)

<<< thread ID: 0x1140, 2021.07.31 15:38:38.304, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da3bb9","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x182c, 2021.07.31 15:38:38.326, 15203 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x8d8, 2021.07.31 15:38:40.024, 1698 ms
{"id":0,"jsonrpc":"2.0","result":["0x361636913388bca34340fc771b039a0474ca9b530be667d1bd1b5b0d6b114698","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe8"]}

--- thread ID: 0x8d8, 2021.07.31 15:38:40.024
epoch = 220 (next epoch in 21752 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:38:53.303, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:11:23.804)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:03:22.790, 33 ms], [fan = 75%, 1727 rpm, 59°C], 30.574176 MH/s (111.93 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:01:06.432,  0 ms], [fan = 75%, 1736 rpm, 60°C], 30.559080 MH/s (109.20 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:01:18.810, 16 ms], [fan = 75%, 1730 rpm, 66°C], 30.547646 MH/s (108.12 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:02:34.829, 17 ms], [fan = 75%, 1738 rpm, 59°C], 30.571103 MH/s (108.87 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:00:56.050,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.546487 MH/s (109.53 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:05:04.281,  0 ms], [fan = 75%, 1726 rpm, 62°C], 30.555564 MH/s (108.64 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 6, S = 0, R = 0, I = 0], [00:00:52.067,  0 ms], [fan = 75%, 1720 rpm, 59°C], 30.532851 MH/s (108.61 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:02:22.513,  0 ms], [fan = 75%, 1728 rpm, 60°C], 30.532740 MH/s (109.51 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:03:05.975,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.524835 MH/s (109.13 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:00:50.949,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.545821 MH/s (109.56 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:05:03.901,  0 ms], [fan = 75%, 1719 rpm, 60°C], 30.542229 MH/s (110.94 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:02:39.834,  0 ms], [fan = 75%, 1727 rpm, 64°C], 30.524471 MH/s (111.02 W) = 366.557003 MH/s (1315.05 W)

<<< thread ID: 0x2324, 2021.07.31 15:38:53.486, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9374b","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:38:53.509, 13485 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2100, 2021.07.31 15:38:56.170, 2660 ms
{"id":0,"jsonrpc":"2.0","result":["0x1ce8da29e2bda10a04b62580dbf70a5a96bf28cf1754ddfde5355a9d13dd4c5d","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffe9"]}

--- thread ID: 0x2100, 2021.07.31 15:38:56.170
epoch = 220 (next epoch in 21751 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:39:08.493, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:11:38.993)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:03:37.980, 41 ms], [fan = 75%, 1703 rpm, 59°C], 30.573307 MH/s (111.11 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:01:21.622, 45 ms], [fan = 75%, 1725 rpm, 60°C], 30.522759 MH/s (108.33 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:01:33.999, 18 ms], [fan = 75%, 1722 rpm, 65°C], 30.564066 MH/s (111.49 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:02:50.018,  0 ms], [fan = 75%, 1713 rpm, 58°C], 30.577269 MH/s (110.37 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:01:11.240,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.567829 MH/s (110.12 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:05:19.470,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.522489 MH/s (108.78 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 6, S = 0, R = 0, I = 0], [00:01:07.256,  0 ms], [fan = 75%, 1707 rpm, 59°C], 30.523060 MH/s (109.49 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:02:37.702,  0 ms], [fan = 75%, 1725 rpm, 60°C], 30.521314 MH/s (111.55 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:03:21.164,  0 ms], [fan = 75%, 1719 rpm, 67°C], 30.522880 MH/s (109.73 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:01:06.138,  0 ms], [fan = 75%, 1725 rpm, 65°C], 30.538994 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 7, S = 0, R = 0, I = 0], [00:05:19.090,  0 ms], [fan = 75%, 1739 rpm, 60°C], 30.545523 MH/s (110.12 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:02:55.023,  0 ms], [fan = 75%, 1732 rpm, 64°C], 30.523877 MH/s (109.97 W) = 366.503367 MH/s (1320.71 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:39:08.690, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d865c7","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:39:08.710, 12540 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1f8c, 2021.07.31 15:39:09.626, 915 ms
{"id":0,"jsonrpc":"2.0","result":["0x5f82d7b6b90216ada49581c48b6b323a8aa1ca3bc2f1a037ccb76772b9d7a1c4","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffea"]}

--- thread ID: 0x1f8c, 2021.07.31 15:39:09.626
epoch = 220 (next epoch in 21750 blocks), share difficulty = 4 GH.

--- thread ID: 0x1ae8, 2021.07.31 15:39:13.748, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 1).
 nonce: 0x498d02c804b46239
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000007858b664d34d9c18658ec76dcb8df1398e7fac42aa0d36225dc83a87
   mix: 0x3622f7b0f7fdf8ea4d093417c9a4ddb339c7df0e84a8961600d82bbd5f7316a3

<<< thread ID: 0x1140, 2021.07.31 15:39:13.748, 0 ms
{"jsonrpc":"2.0","id":1054,"method":"eth_submitWork","params":["0x498d02c804b46239","0x5f82d7b6b90216ada49581c48b6b323a8aa1ca3bc2f1a037ccb76772b9d7a1c4","0x3622f7b0f7fdf8ea4d093417c9a4ddb339c7df0e84a8961600d82bbd5f7316a3"],"worker":"alphagruis"}

--- thread ID: 0x182c, 2021.07.31 15:39:13.771, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:39:13.771, 4144 ms (22 ms)
{"id":1054,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:39:23.705, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:11:54.205)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:03:53.192,  2 ms], [fan = 75%, 1726 rpm, 59°C], 30.576795 MH/s (109.78 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:01:36.834, 54 ms], [fan = 75%, 1710 rpm, 60°C], 30.544422 MH/s (111.33 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:01:49.212, 38 ms], [fan = 75%, 1732 rpm, 65°C], 30.548559 MH/s (108.89 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:03:05.231,  0 ms], [fan = 75%, 1721 rpm, 58°C], 30.562632 MH/s (110.50 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:01:26.452,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.561155 MH/s (108.12 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:05:34.683,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.546371 MH/s (109.22 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 6, S = 0, R = 0, I = 0], [00:01:22.469,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.544609 MH/s (109.49 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:02:52.914,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.555125 MH/s (110.02 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:03:36.377,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.546783 MH/s (109.45 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:01:21.351,  0 ms], [fan = 75%, 1733 rpm, 65°C], 30.521452 MH/s (110.84 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 8, S = 0, R = 0, I = 0], [00:00:09.957,  0 ms], [fan = 75%, 1714 rpm, 60°C], 30.521165 MH/s (110.57 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:03:10.236,  0 ms], [fan = 75%, 1735 rpm, 64°C], 30.549207 MH/s (109.39 W) = 366.578275 MH/s (1317.61 W)

<<< thread ID: 0x8d8, 2021.07.31 15:39:23.932, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d98a63","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2324, 2021.07.31 15:39:23.985, 10213 ms (52 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0xe6c, 2021.07.31 15:39:28.349, 4364 ms
{"id":0,"jsonrpc":"2.0","result":["0xf39f88535d5d5f2a02c5fe224ac51e41617d0f76f4978859ebbc80a216c42f26","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffeb"]}

--- thread ID: 0xe6c, 2021.07.31 15:39:28.350
epoch = 220 (next epoch in 21749 blocks), share difficulty = 4 GH.

>>> thread ID: 0x2100, 2021.07.31 15:39:35.399, 7049 ms
{"id":0,"jsonrpc":"2.0","result":["0xf60316346c30183b39d3a67fc31aae7b675a70003e26da2447712ea73e1caf8d","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffec"]}

--- thread ID: 0x2100, 2021.07.31 15:39:35.399
epoch = 220 (next epoch in 21748 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1fe0, 2021.07.31 15:39:36.445, 1045 ms
{"id":0,"jsonrpc":"2.0","result":["0x87a3472019ac949284953b87c967ef2f0b522d35476c9fba4fd769f880fe2d0d","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffed"]}

--- thread ID: 0x1fe0, 2021.07.31 15:39:36.445
epoch = 220 (next epoch in 21747 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:39:38.928, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:12:09.428)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:04:08.415, 42 ms], [fan = 75%, 1729 rpm, 59°C], 30.574696 MH/s (109.25 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:01:52.057, 18 ms], [fan = 75%, 1723 rpm, 60°C], 30.560777 MH/s (109.41 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:02:04.435,  4 ms], [fan = 75%, 1738 rpm, 65°C], 30.561394 MH/s (107.80 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:03:20.453, 12 ms], [fan = 75%, 1719 rpm, 58°C], 30.559017 MH/s (108.97 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:01:41.675,  0 ms], [fan = 75%, 1722 rpm, 62°C], 30.562191 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:05:49.906,  0 ms], [fan = 75%, 1726 rpm, 62°C], 30.532804 MH/s (109.09 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 6, S = 0, R = 0, I = 0], [00:01:37.692,  0 ms], [fan = 75%, 1712 rpm, 59°C], 30.532606 MH/s (108.70 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:03:08.137,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.553116 MH/s (108.87 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:03:51.599,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.549216 MH/s (109.54 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:01:36.573,  0 ms], [fan = 75%, 1716 rpm, 65°C], 30.524904 MH/s (111.18 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 8, S = 0, R = 0, I = 0], [00:00:25.180,  0 ms], [fan = 75%, 1719 rpm, 60°C], 30.523433 MH/s (110.75 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:03:25.459,  0 ms], [fan = 75%, 1710 rpm, 64°C], 30.545697 MH/s (109.16 W) = 366.579851 MH/s (1312.60 W)

<<< thread ID: 0x1e74, 2021.07.31 15:39:39.120, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9908b","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1f8c, 2021.07.31 15:39:39.142, 2697 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1140, 2021.07.31 15:39:41.803, 2661 ms
{"id":0,"jsonrpc":"2.0","result":["0xd6d110cd8f25b040a23e62984fc236d08ecb70bf95227b1829f8a404f540d46c","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffee"]}

--- thread ID: 0x1140, 2021.07.31 15:39:41.804
epoch = 220 (next epoch in 21746 blocks), share difficulty = 4 GH.

--- thread ID: 0x2b98, 2021.07.31 15:39:50.414, PCIe: 00000000:09:00.0, GPU.07 share found (search channel 0).
 nonce: 0x498d02cb2557483a
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000ffca5a906c9409227ba6dd4eb667a8a5958cb9ba56b9ce86370f7b93
   mix: 0x2bcddc4ef90d51bede4e6a6c8a339ce81c3c4fee73820b206b573669b9d79bd7

<<< thread ID: 0x182c, 2021.07.31 15:39:50.415, 0 ms
{"jsonrpc":"2.0","id":1055,"method":"eth_submitWork","params":["0x498d02cb2557483a","0xd6d110cd8f25b040a23e62984fc236d08ecb70bf95227b1829f8a404f540d46c","0x2bcddc4ef90d51bede4e6a6c8a339ce81c3c4fee73820b206b573669b9d79bd7"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:39:50.436, PCIe: 00000000:09:00.0, GPU.07 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:39:50.436, 8632 ms (21 ms)
{"id":1055,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:39:54.129, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:12:24.630)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:04:23.616, 58 ms], [fan = 75%, 1734 rpm, 59°C], 30.562866 MH/s (108.48 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:02:07.258, 29 ms], [fan = 75%, 1736 rpm, 60°C], 30.560958 MH/s (109.27 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:02:19.636,  0 ms], [fan = 75%, 1754 rpm, 65°C], 30.527377 MH/s (107.80 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:03:35.655,  0 ms], [fan = 75%, 1741 rpm, 58°C], 30.568954 MH/s (110.52 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:01:56.876,  0 ms], [fan = 75%, 1730 rpm, 62°C], 30.563617 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:06:05.107,  0 ms], [fan = 75%, 1732 rpm, 62°C], 30.530682 MH/s (109.42 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:00:03.715,  0 ms], [fan = 75%, 1726 rpm, 59°C], 30.529340 MH/s (111.33 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:03:23.338,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.542864 MH/s (110.99 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:04:06.801,  0 ms], [fan = 75%, 1737 rpm, 67°C], 30.514229 MH/s (110.53 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:01:51.775,  0 ms], [fan = 75%, 1731 rpm, 65°C], 30.525282 MH/s (109.33 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 8, S = 0, R = 0, I = 0], [00:00:40.381,  0 ms], [fan = 75%, 1717 rpm, 60°C], 30.525462 MH/s (109.63 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:03:40.660,  0 ms], [fan = 75%, 1735 rpm, 64°C], 30.514208 MH/s (109.39 W) = 366.465839 MH/s (1316.56 W)

<<< thread ID: 0x2324, 2021.07.31 15:39:54.326, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d7d32f","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:39:54.349, 3913 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1ae8, 2021.07.31 15:40:04.529, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 1).
 nonce: 0x498d02cc59d1bf4e
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000002d8cb3a7eb42a8b67f1d8a07e52973ff4f4d6fdc4316affd1135a8fd
   mix: 0x03e461fcea445d02175f9b62543c34a6277fc7dce6b88eea871989473088941b

<<< thread ID: 0x2100, 2021.07.31 15:40:04.529, 0 ms
{"jsonrpc":"2.0","id":1056,"method":"eth_submitWork","params":["0x498d02cc59d1bf4e","0xd6d110cd8f25b040a23e62984fc236d08ecb70bf95227b1829f8a404f540d46c","0x03e461fcea445d02175f9b62543c34a6277fc7dce6b88eea871989473088941b"],"worker":"alphagruis"}

--- thread ID: 0x1fe0, 2021.07.31 15:40:04.550, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x1fe0, 2021.07.31 15:40:04.550, 10200 ms (21 ms)
{"id":1056,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1e74, 2021.07.31 15:40:08.295, 3745 ms
{"id":0,"jsonrpc":"2.0","result":["0x2ef1918bdb48093f51261bd4f80aace74264baef65ea00cfddd01323bbb08f93","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9ffef"]}

--- thread ID: 0x1e74, 2021.07.31 15:40:08.295
epoch = 220 (next epoch in 21745 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:40:09.346, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:12:39.846)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:04:38.833, 23 ms], [fan = 75%, 1711 rpm, 59°C], 30.576097 MH/s (109.01 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:02:22.475, 51 ms], [fan = 75%, 1715 rpm, 60°C], 30.551762 MH/s (108.94 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:02:34.852, 24 ms], [fan = 75%, 1716 rpm, 65°C], 30.558589 MH/s (111.40 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:03:50.871,  0 ms], [fan = 75%, 1724 rpm, 59°C], 30.571367 MH/s (109.83 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:02:12.092,  0 ms], [fan = 75%, 1707 rpm, 62°C], 30.566795 MH/s (109.97 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:06:20.323,  0 ms], [fan = 75%, 1723 rpm, 62°C], 30.552495 MH/s (110.90 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:00:18.931,  0 ms], [fan = 75%, 1726 rpm, 59°C], 30.550013 MH/s (110.93 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:03:38.555,  0 ms], [fan = 75%, 1728 rpm, 60°C], 30.544938 MH/s (109.51 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:04:22.017,  0 ms], [fan = 75%, 1719 rpm, 67°C], 30.519656 MH/s (110.53 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:02:06.991,  0 ms], [fan = 75%, 1717 rpm, 65°C], 30.546384 MH/s (109.33 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:00:04.817,  0 ms], [fan = 75%, 1714 rpm, 60°C], 30.548395 MH/s (108.09 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:03:55.876,  0 ms], [fan = 75%, 1721 rpm, 64°C], 30.519928 MH/s (108.52 W) = 366.606419 MH/s (1316.95 W)

<<< thread ID: 0x1f8c, 2021.07.31 15:40:09.526, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9f853","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:40:09.547, 1251 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:40:24.538, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:12:55.038)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:04:54.025, 32 ms], [fan = 75%, 1719 rpm, 59°C], 30.575313 MH/s (109.01 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:02:37.667,  0 ms], [fan = 75%, 1720 rpm, 60°C], 30.546772 MH/s (109.61 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:02:50.045,  0 ms], [fan = 75%, 1730 rpm, 65°C], 30.559215 MH/s (109.53 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:04:06.063,  0 ms], [fan = 75%, 1713 rpm, 59°C], 30.573728 MH/s (109.91 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:02:27.285,  0 ms], [fan = 75%, 1717 rpm, 62°C], 30.566903 MH/s (109.84 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:06:35.516,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.555207 MH/s (109.34 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:00:34.124,  0 ms], [fan = 75%, 1718 rpm, 59°C], 30.558220 MH/s (108.67 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:03:53.747,  0 ms], [fan = 75%, 1720 rpm, 60°C], 30.545615 MH/s (111.22 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:04:37.209,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.539856 MH/s (109.54 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:02:22.183,  0 ms], [fan = 75%, 1725 rpm, 65°C], 30.543818 MH/s (109.56 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:00:20.009,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.545729 MH/s (110.73 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:04:11.069,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.543437 MH/s (109.72 W) = 366.653813 MH/s (1316.69 W)

<<< thread ID: 0x182c, 2021.07.31 15:40:24.766, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015dab175","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x8d8, 2021.07.31 15:40:24.788, 15241 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:40:39.786, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:13:10.286)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:05:09.273, 29 ms], [fan = 75%, 1706 rpm, 59°C], 30.574787 MH/s (110.61 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 4, S = 0, R = 0, I = 0], [00:02:52.915, 37 ms], [fan = 75%, 1733 rpm, 60°C], 30.561346 MH/s (111.33 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 4, S = 0, R = 0, I = 0], [00:03:05.293, 19 ms], [fan = 75%, 1730 rpm, 65°C], 30.566455 MH/s (109.80 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:04:21.311,  0 ms], [fan = 75%, 1719 rpm, 59°C], 30.570672 MH/s (109.45 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:02:42.533,  0 ms], [fan = 75%, 1733 rpm, 62°C], 30.565867 MH/s (109.55 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:06:50.764,  0 ms], [fan = 75%, 1731 rpm, 62°C], 30.535904 MH/s (109.33 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:00:49.372,  0 ms], [fan = 75%, 1726 rpm, 59°C], 30.551677 MH/s (108.37 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 2, S = 0, R = 0, I = 0], [00:04:08.995,  0 ms], [fan = 75%, 1731 rpm, 60°C], 30.553437 MH/s (108.81 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:04:52.457,  0 ms], [fan = 75%, 1729 rpm, 67°C], 30.536352 MH/s (109.45 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 6, S = 0, R = 0, I = 0], [00:02:37.431,  0 ms], [fan = 75%, 1714 rpm, 65°C], 30.548223 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:00:35.257,  0 ms], [fan = 75%, 1733 rpm, 60°C], 30.543143 MH/s (109.85 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:04:26.317,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.541951 MH/s (109.49 W) = 366.649814 MH/s (1315.70 W)

<<< thread ID: 0x2324, 2021.07.31 15:40:39.962, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015daa1d6","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0xe6c, 2021.07.31 15:40:39.985, 15197 ms (23 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xee0, 2021.07.31 15:40:42.704, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 0).
 nonce: 0x498d02cf9c1899cd
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000009f3ac997f1662601cfea3764c32e93daa07e07bba7bd203e893987c0
   mix: 0xeacbe17bb49fff8a88eaf206b553e75986e8ed3d9f6764eb534530f4ce0546b8

<<< thread ID: 0x2100, 2021.07.31 15:40:42.704, 0 ms
{"jsonrpc":"2.0","id":1057,"method":"eth_submitWork","params":["0x498d02cf9c1899cd","0x2ef1918bdb48093f51261bd4f80aace74264baef65ea00cfddd01323bbb08f93","0xeacbe17bb49fff8a88eaf206b553e75986e8ed3d9f6764eb534530f4ce0546b8"],"worker":"alphagruis"}

--- thread ID: 0x1fe0, 2021.07.31 15:40:42.725, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0x1fe0, 2021.07.31 15:40:42.725, 2739 ms (21 ms)
{"id":1057,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1e74, 2021.07.31 15:40:46.269, 3544 ms
{"id":0,"jsonrpc":"2.0","result":["0x5b7402c012fbfe5b83617163f219bb5eec3ea255a77d631acd82972ebef28cdc","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff0"]}

--- thread ID: 0x1e74, 2021.07.31 15:40:46.270
epoch = 220 (next epoch in 21744 blocks), share difficulty = 4 GH.

--- thread ID: 0xd20, 2021.07.31 15:40:47.233, PCIe: 00000000:0d:00.0, GPU.10 share found (search channel 1).
 nonce: 0x498d02cfff34e572
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000008b4f0733fee7c240f9490b851c52998f36c139ddd1ef3c6abb277eac
   mix: 0x6a90520919c58fef9ddd6774fda3bdb6f84ed45b74df9db9d57da36fa37b536b

<<< thread ID: 0x1f8c, 2021.07.31 15:40:47.234, 0 ms
{"jsonrpc":"2.0","id":1058,"method":"eth_submitWork","params":["0x498d02cfff34e572","0x5b7402c012fbfe5b83617163f219bb5eec3ea255a77d631acd82972ebef28cdc","0x6a90520919c58fef9ddd6774fda3bdb6f84ed45b74df9db9d57da36fa37b536b"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:40:47.255, PCIe: 00000000:0d:00.0, GPU.10 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:40:47.255, 985 ms (21 ms)
{"id":1058,"jsonrpc":"2.0","result":true}

--- thread ID: 0xa50, 2021.07.31 15:40:47.670, PCIe: 00000000:03:00.0, GPU.03 share found (search channel 0).
 nonce: 0x498d02d008a30b06
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000d21ac2a6242e2c50d7bb06c9bb0ede80c88e5c5ad463a85594a57597
   mix: 0x74fdabfe07f5112e27fc016db7d995ee2377fd4228014ab36cdd11c6be72c4a8

<<< thread ID: 0x182c, 2021.07.31 15:40:47.670, 0 ms
{"jsonrpc":"2.0","id":1059,"method":"eth_submitWork","params":["0x498d02d008a30b06","0x5b7402c012fbfe5b83617163f219bb5eec3ea255a77d631acd82972ebef28cdc","0x74fdabfe07f5112e27fc016db7d995ee2377fd4228014ab36cdd11c6be72c4a8"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:40:47.690, PCIe: 00000000:03:00.0, GPU.03 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:40:47.690, 435 ms (20 ms)
{"id":1059,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2324, 2021.07.31 15:40:47.846, 155 ms
{"id":0,"jsonrpc":"2.0","result":["0x5887ab676b7226137e7be1958f8eeee748db812066b24c91a442a7bfe55d1013","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff1"]}

--- thread ID: 0x2324, 2021.07.31 15:40:47.846
epoch = 220 (next epoch in 21743 blocks), share difficulty = 4 GH.

--- thread ID: 0xf60, 2021.07.31 15:40:49.240, PCIe: 00000000:0a:00.0, GPU.08 share found (search channel 1).
 nonce: 0x498d02d02b253086
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000f9275632754dd22ae27ddb553bf608512bcac69644ec79706d92d257
   mix: 0x6772084ecbf1cbaea3e399a9d00d9156cc74d93a5710b66c3272750fe410d4b9

<<< thread ID: 0xe6c, 2021.07.31 15:40:49.240, 0 ms
{"jsonrpc":"2.0","id":1060,"method":"eth_submitWork","params":["0x498d02d02b253086","0x5887ab676b7226137e7be1958f8eeee748db812066b24c91a442a7bfe55d1013","0x6772084ecbf1cbaea3e399a9d00d9156cc74d93a5710b66c3272750fe410d4b9"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:40:49.265, PCIe: 00000000:0a:00.0, GPU.08 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:40:49.265, 1418 ms (25 ms)
{"id":1060,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:40:54.986, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:13:25.487)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:05:24.473, 48 ms], [fan = 75%, 1719 rpm, 59°C], 30.577766 MH/s (111.62 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 5, S = 0, R = 0, I = 0], [00:00:12.282, 48 ms], [fan = 75%, 1710 rpm, 59°C], 30.560438 MH/s (109.11 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 5, S = 0, R = 0, I = 0], [00:00:07.317, 31 ms], [fan = 75%, 1719 rpm, 65°C], 30.560376 MH/s (109.12 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:04:36.512,  7 ms], [fan = 75%, 1727 rpm, 59°C], 30.564549 MH/s (109.63 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:02:57.733,  0 ms], [fan = 75%, 1736 rpm, 62°C], 30.566893 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:07:05.964,  0 ms], [fan = 75%, 1715 rpm, 62°C], 30.532737 MH/s (109.02 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:01:04.572,  0 ms], [fan = 75%, 1734 rpm, 59°C], 30.555537 MH/s (108.47 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 3, S = 0, R = 0, I = 0], [00:00:05.747,  0 ms], [fan = 75%, 1725 rpm, 60°C], 30.552870 MH/s (109.27 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:05:07.658,  0 ms], [fan = 75%, 1721 rpm, 67°C], 30.531951 MH/s (109.76 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 7, S = 0, R = 0, I = 0], [00:00:07.753,  0 ms], [fan = 75%, 1719 rpm, 65°C], 30.545017 MH/s (108.47 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:00:50.458,  0 ms], [fan = 75%, 1733 rpm, 60°C], 30.537816 MH/s (110.40 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:04:41.517,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.545063 MH/s (109.72 W) = 366.631013 MH/s (1314.48 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:40:55.178, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da5865","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:40:55.199, 5933 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:41:10.191, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:13:40.691)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:05:39.678,  4 ms], [fan = 75%, 1714 rpm, 59°C], 30.581095 MH/s (111.37 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 5, S = 0, R = 0, I = 0], [00:00:27.487, 48 ms], [fan = 75%, 1715 rpm, 60°C], 30.526831 MH/s (108.27 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 5, S = 0, R = 0, I = 0], [00:00:22.521,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.564086 MH/s (107.33 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:04:51.716, 27 ms], [fan = 75%, 1721 rpm, 59°C], 30.572626 MH/s (109.00 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 2, S = 0, R = 0, I = 0], [00:03:12.937,  0 ms], [fan = 75%, 1722 rpm, 62°C], 30.564035 MH/s (109.75 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:07:21.168,  0 ms], [fan = 75%, 1715 rpm, 62°C], 30.536617 MH/s (109.08 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:01:19.776,  0 ms], [fan = 75%, 1728 rpm, 59°C], 30.556703 MH/s (111.02 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 3, S = 0, R = 0, I = 0], [00:00:20.951,  0 ms], [fan = 75%, 1737 rpm, 60°C], 30.540179 MH/s (109.29 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 4, S = 0, R = 0, I = 0], [00:05:22.862,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.535119 MH/s (109.45 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 7, S = 0, R = 0, I = 0], [00:00:22.957,  0 ms], [fan = 75%, 1717 rpm, 65°C], 30.526062 MH/s (108.51 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:01:05.662,  0 ms], [fan = 75%, 1738 rpm, 60°C], 30.547896 MH/s (110.40 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:04:56.721,  0 ms], [fan = 75%, 1729 rpm, 64°C], 30.545141 MH/s (111.42 W) = 366.596390 MH/s (1314.87 W)

<<< thread ID: 0x1f8c, 2021.07.31 15:41:10.373, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9d126","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1140, 2021.07.31 15:41:10.394, 15195 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x182c, 2021.07.31 15:41:11.861, 1466 ms
{"id":0,"jsonrpc":"2.0","result":["0x9d0f879afebcef4b9bb3f83f9f8c8fb3920b48d0853b5e228571323300ec9007","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff1"]}

--- thread ID: 0x182c, 2021.07.31 15:41:11.861
epoch = 220 (next epoch in 21743 blocks), share difficulty = 4 GH.

>>> thread ID: 0x8d8, 2021.07.31 15:41:15.844, 3983 ms
{"id":0,"jsonrpc":"2.0","result":["0x17c84cdbb9bef5f3aead86cdf5be8c7dfa26818f2b22714267870efa87b57529","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff1"]}

--- thread ID: 0x8d8, 2021.07.31 15:41:15.844
epoch = 220 (next epoch in 21743 blocks), share difficulty = 4 GH.

--- thread ID: 0x11d8, 2021.07.31 15:41:17.675, PCIe: 00000000:05:00.0, GPU.05 share found (search channel 1).
 nonce: 0x498d02d298668c47
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000001038898ea02f7d6311f00532020fb0a774a60a1f1802d29781f17b65c
   mix: 0x3e5bf3ebe5fa9c7ea7fa4be76119692231dcac9c649df1f505a66e8829767dfd

<<< thread ID: 0x2324, 2021.07.31 15:41:17.675, 0 ms
{"jsonrpc":"2.0","id":1061,"method":"eth_submitWork","params":["0x498d02d298668c47","0x17c84cdbb9bef5f3aead86cdf5be8c7dfa26818f2b22714267870efa87b57529","0x3e5bf3ebe5fa9c7ea7fa4be76119692231dcac9c649df1f505a66e8829767dfd"],"worker":"alphagruis"}

--- thread ID: 0xe6c, 2021.07.31 15:41:17.696, PCIe: 00000000:05:00.0, GPU.05 share accepted.

>>> thread ID: 0xe6c, 2021.07.31 15:41:17.696, 1852 ms (21 ms)
{"id":1061,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2100, 2021.07.31 15:41:19.870, 2174 ms
{"id":0,"jsonrpc":"2.0","result":["0x1b41ec516ea0cfafec0c4f5fd0624c93be9becec64399d304e41d1754997c4ca","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff1"]}

--- thread ID: 0x2100, 2021.07.31 15:41:19.870
epoch = 220 (next epoch in 21743 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1fe0, 2021.07.31 15:41:22.733, 2862 ms
{"id":0,"jsonrpc":"2.0","result":["0xb799c48676bd2c3599a117030bdedd660933c50462a70e5547f0a54b545d056f","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff2"]}

--- thread ID: 0x1fe0, 2021.07.31 15:41:22.733
epoch = 220 (next epoch in 21742 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1e74, 2021.07.31 15:41:22.740, 7 ms
{"id":0,"jsonrpc":"2.0","result":["0x85267cc2ad708657a2cd403056982d32533e98c506276e797c57a5684a2422aa","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff2"]}

--- thread ID: 0x1e74, 2021.07.31 15:41:22.740
epoch = 220 (next epoch in 21742 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1f8c, 2021.07.31 15:41:22.983, 242 ms
{"id":0,"jsonrpc":"2.0","result":["0xb799c48676bd2c3599a117030bdedd660933c50462a70e5547f0a54b545d056f","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff2"]}

--- thread ID: 0x1f8c, 2021.07.31 15:41:22.983
epoch = 220 (next epoch in 21742 blocks), share difficulty = 4 GH.

--- thread ID: 0xd20, 2021.07.31 15:41:23.484, PCIe: 00000000:0d:00.0, GPU.10 share found (search channel 1).
 nonce: 0x498d02d31775efc7
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000e918a7eec41f69bfdb01ccd6981fe7c468c3a63c6548d2908b3a66a3
   mix: 0x1944f4ce6cfebb90fa05d38fcd35f74088a8ae470513c15c19b5367e7ed25fcf

<<< thread ID: 0x1140, 2021.07.31 15:41:23.484, 0 ms
{"jsonrpc":"2.0","id":1062,"method":"eth_submitWork","params":["0x498d02d31775efc7","0xb799c48676bd2c3599a117030bdedd660933c50462a70e5547f0a54b545d056f","0x1944f4ce6cfebb90fa05d38fcd35f74088a8ae470513c15c19b5367e7ed25fcf"],"worker":"alphagruis"}

--- thread ID: 0x182c, 2021.07.31 15:41:23.505, PCIe: 00000000:0d:00.0, GPU.10 share accepted.

>>> thread ID: 0x182c, 2021.07.31 15:41:23.505, 521 ms (20 ms)
{"id":1062,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1aa8, 2021.07.31 15:41:23.943, PCIe: 00000000:0c:00.0, GPU.09 share found (search channel 1).
 nonce: 0x498d02d32159c78c
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000b4d24db1484f38bb93d6077b3abc89e181cfa876cb46cd33585ea046
   mix: 0x1b8b1d6ffde4cbd9b170fffb39788f723c9af1dc9bfe49d94416305020fa5b80

<<< thread ID: 0x8d8, 2021.07.31 15:41:23.943, 0 ms
{"jsonrpc":"2.0","id":1063,"method":"eth_submitWork","params":["0x498d02d32159c78c","0xb799c48676bd2c3599a117030bdedd660933c50462a70e5547f0a54b545d056f","0x1b8b1d6ffde4cbd9b170fffb39788f723c9af1dc9bfe49d94416305020fa5b80"],"worker":"alphagruis"}

--- thread ID: 0x2324, 2021.07.31 15:41:23.965, PCIe: 00000000:0c:00.0, GPU.09 share accepted.

>>> thread ID: 0x2324, 2021.07.31 15:41:23.965, 459 ms (21 ms)
{"id":1063,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:41:25.392, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:13:55.893)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:05:54.879, 23 ms], [fan = 75%, 1729 rpm, 59°C], 30.575233 MH/s (111.57 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 5, S = 0, R = 0, I = 0], [00:00:42.689,  0 ms], [fan = 75%, 1739 rpm, 60°C], 30.561648 MH/s (109.64 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 5, S = 0, R = 0, I = 0], [00:00:37.723,  0 ms], [fan = 75%, 1724 rpm, 65°C], 30.538917 MH/s (108.04 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 4, S = 0, R = 0, I = 0], [00:05:06.918,  0 ms], [fan = 75%, 1730 rpm, 59°C], 30.570588 MH/s (110.56 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 3, S = 0, R = 0, I = 0], [00:00:07.718,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.553904 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:07:36.370,  0 ms], [fan = 75%, 1714 rpm, 62°C], 30.552349 MH/s (109.11 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:01:34.978,  0 ms], [fan = 75%, 1718 rpm, 59°C], 30.554282 MH/s (108.83 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 3, S = 0, R = 0, I = 0], [00:00:36.153,  0 ms], [fan = 75%, 1720 rpm, 60°C], 30.539203 MH/s (108.73 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 5, S = 0, R = 0, I = 0], [00:00:01.450,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.544596 MH/s (109.81 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 8, S = 0, R = 0, I = 0], [00:00:01.908,  0 ms], [fan = 75%, 1728 rpm, 65°C], 30.543641 MH/s (108.97 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:01:20.864,  0 ms], [fan = 75%, 1701 rpm, 60°C], 30.542943 MH/s (108.18 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:05:11.923,  0 ms], [fan = 75%, 1715 rpm, 64°C], 30.540218 MH/s (109.74 W) = 366.617522 MH/s (1313.07 W)

<<< thread ID: 0xe6c, 2021.07.31 15:41:25.585, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da23b2","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2100, 2021.07.31 15:41:25.608, 1643 ms (23 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1fe0, 2021.07.31 15:41:26.712, 1103 ms
{"id":0,"jsonrpc":"2.0","result":["0xd537bae3d9839d58bd300e86a4a22310c089071c6c2e0dee42985e2b84a2ff41","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff2"]}

--- thread ID: 0x1fe0, 2021.07.31 15:41:26.712
epoch = 220 (next epoch in 21742 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1e74, 2021.07.31 15:41:28.660, 1948 ms
{"id":0,"jsonrpc":"2.0","result":["0xadf36e423f824d58395ea41fa582d3c093ba2ea7ca51d26f4f328b432a421170","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff3"]}

--- thread ID: 0x1e74, 2021.07.31 15:41:28.660
epoch = 220 (next epoch in 21741 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1f8c, 2021.07.31 15:41:32.944, 4284 ms
{"id":0,"jsonrpc":"2.0","result":["0x9c8220610442352b870341007d26a8b44b5cf998ebcd67d05d3428b42fcc8afd","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff4"]}

--- thread ID: 0x1f8c, 2021.07.31 15:41:32.944
epoch = 220 (next epoch in 21740 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1140, 2021.07.31 15:41:36.961, 4017 ms
{"id":0,"jsonrpc":"2.0","result":["0xe9bb37ae76496fa348c8541ee88fcaf8400ae322e2caaf2a1d6c10878a833ddf","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff4"]}

--- thread ID: 0x1140, 2021.07.31 15:41:36.961
epoch = 220 (next epoch in 21740 blocks), share difficulty = 4 GH.

--- thread ID: 0x20d8, 2021.07.31 15:41:38.198, PCIe: 00000000:04:00.0, GPU.04 share found (search channel 1).
 nonce: 0x498d02d458d58654
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000845cc9e6d40c2b0172a3c0383ba7f8fc0c7718f75f039460f9fe334e
   mix: 0xb329796208c8394bde9ed52b2ca3b2ee1bb331ca046100ee92cd8d0e0c0e8e44

<<< thread ID: 0x182c, 2021.07.31 15:41:38.198, 0 ms
{"jsonrpc":"2.0","id":1064,"method":"eth_submitWork","params":["0x498d02d458d58654","0xe9bb37ae76496fa348c8541ee88fcaf8400ae322e2caaf2a1d6c10878a833ddf","0xb329796208c8394bde9ed52b2ca3b2ee1bb331ca046100ee92cd8d0e0c0e8e44"],"worker":"alphagruis"}

--- thread ID: 0x8d8, 2021.07.31 15:41:38.220, PCIe: 00000000:04:00.0, GPU.04 share accepted.

>>> thread ID: 0x8d8, 2021.07.31 15:41:38.220, 1258 ms (21 ms)
{"id":1064,"jsonrpc":"2.0","result":true}

--- thread ID: 0xee0, 2021.07.31 15:41:38.463, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 1).
 nonce: 0x498d02d45e7ab3d9
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000006b5b2ef70ff20a9a4afc51a88100226c307ef65a267398c753230e03
   mix: 0xaf36020379e5f0fe7a7866c5afd48278955cce2f0277748cfd4dd03d73ca09f7

<<< thread ID: 0x2324, 2021.07.31 15:41:38.463, 0 ms
{"jsonrpc":"2.0","id":1065,"method":"eth_submitWork","params":["0x498d02d45e7ab3d9","0xe9bb37ae76496fa348c8541ee88fcaf8400ae322e2caaf2a1d6c10878a833ddf","0xaf36020379e5f0fe7a7866c5afd48278955cce2f0277748cfd4dd03d73ca09f7"],"worker":"alphagruis"}

--- thread ID: 0xe6c, 2021.07.31 15:41:38.484, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0xe6c, 2021.07.31 15:41:38.484, 264 ms (20 ms)
{"id":1065,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:41:40.581, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:14:11.081)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:06:10.068, 29 ms], [fan = 75%, 1711 rpm, 59°C], 30.574459 MH/s (110.82 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 6, S = 0, R = 0, I = 0], [00:00:02.118,  0 ms], [fan = 75%, 1738 rpm, 60°C], 30.554068 MH/s (110.78 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 5, S = 0, R = 0, I = 0], [00:00:52.911,  0 ms], [fan = 75%, 1703 rpm, 65°C], 30.563072 MH/s (111.63 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 5, S = 0, R = 0, I = 0], [00:00:02.382,  0 ms], [fan = 75%, 1741 rpm, 59°C], 30.569748 MH/s (109.70 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 3, S = 0, R = 0, I = 0], [00:00:22.906,  0 ms], [fan = 75%, 1730 rpm, 62°C], 30.564118 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:07:51.558,  0 ms], [fan = 75%, 1732 rpm, 62°C], 30.551392 MH/s (109.11 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:01:50.166,  0 ms], [fan = 75%, 1712 rpm, 59°C], 30.554582 MH/s (108.35 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 3, S = 0, R = 0, I = 0], [00:00:51.341,  0 ms], [fan = 75%, 1723 rpm, 60°C], 30.544892 MH/s (109.20 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 5, S = 0, R = 0, I = 0], [00:00:16.638,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.543415 MH/s (109.28 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 8, S = 0, R = 0, I = 0], [00:00:17.097,  0 ms], [fan = 75%, 1714 rpm, 65°C], 30.535515 MH/s (111.26 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:01:36.052,  0 ms], [fan = 75%, 1743 rpm, 60°C], 30.542015 MH/s (110.12 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:05:27.112,  0 ms], [fan = 75%, 1727 rpm, 64°C], 30.543827 MH/s (109.72 W) = 366.641103 MH/s (1319.86 W)

<<< thread ID: 0x2100, 2021.07.31 15:41:40.780, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da7fcf","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1fe0, 2021.07.31 15:41:40.803, 2318 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1e74, 2021.07.31 15:41:49.721, 8918 ms
{"id":0,"jsonrpc":"2.0","result":["0x99687495cb50ada9db761b5a8873976905b5a1d11414b3241065d5ebc7ab715f","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff5"]}

--- thread ID: 0x1e74, 2021.07.31 15:41:49.722
epoch = 220 (next epoch in 21739 blocks), share difficulty = 4 GH.

--- thread ID: 0xee0, 2021.07.31 15:41:52.278, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 0).
 nonce: 0x498d02d58c6276c8
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000500022a993dce95545f7c2ca7c29faf3de82567754ae359e7e73f5e4
   mix: 0x399542ab0c4f2441aa8863a1f823b7200560216507a74aa7abfbfc50edaab7aa

<<< thread ID: 0x1f8c, 2021.07.31 15:41:52.278, 0 ms
{"jsonrpc":"2.0","id":1066,"method":"eth_submitWork","params":["0x498d02d58c6276c8","0x99687495cb50ada9db761b5a8873976905b5a1d11414b3241065d5ebc7ab715f","0x399542ab0c4f2441aa8863a1f823b7200560216507a74aa7abfbfc50edaab7aa"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:41:52.300, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:41:52.300, 2578 ms (22 ms)
{"id":1066,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:41:55.783, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:14:26.283)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:06:25.270, 46 ms], [fan = 75%, 1701 rpm, 59°C], 30.574942 MH/s (111.69 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 7, S = 0, R = 0, I = 0], [00:00:03.505,  0 ms], [fan = 75%, 1752 rpm, 60°C], 30.561909 MH/s (110.56 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 5, S = 0, R = 0, I = 0], [00:01:08.113,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.567349 MH/s (111.40 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 5, S = 0, R = 0, I = 0], [00:00:17.585,  0 ms], [fan = 75%, 1733 rpm, 58°C], 30.571570 MH/s (109.30 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 3, S = 0, R = 0, I = 0], [00:00:38.108,  0 ms], [fan = 75%, 1733 rpm, 62°C], 30.564687 MH/s (109.46 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:08:06.761, 11 ms], [fan = 75%, 1726 rpm, 62°C], 30.552153 MH/s (108.27 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:02:05.369,  0 ms], [fan = 75%, 1731 rpm, 59°C], 30.551122 MH/s (111.06 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 3, S = 0, R = 0, I = 0], [00:01:06.543,  0 ms], [fan = 75%, 1734 rpm, 60°C], 30.550830 MH/s (109.44 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 5, S = 0, R = 0, I = 0], [00:00:31.840,  0 ms], [fan = 75%, 1732 rpm, 66°C], 30.547963 MH/s (110.53 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 8, S = 0, R = 0, I = 0], [00:00:32.299,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.542343 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:01:51.254,  0 ms], [fan = 75%, 1735 rpm, 60°C], 30.545294 MH/s (110.89 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:05:42.314,  0 ms], [fan = 75%, 1721 rpm, 64°C], 30.541488 MH/s (109.72 W) = 366.671650 MH/s (1321.97 W)

<<< thread ID: 0x182c, 2021.07.31 15:41:55.950, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015daf722","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x8d8, 2021.07.31 15:41:55.971, 3670 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xf60, 2021.07.31 15:41:59.037, PCIe: 00000000:0a:00.0, GPU.08 share found (search channel 1).
 nonce: 0x498d02d6204f31db
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000003904bf6efed89706ab278a526c697ce41e6a46390709581d04eca800
   mix: 0x6474694985f8a5a556395eff7bef2c9c51b7968cf0f4bc0edc95d5e7950ae8e8

<<< thread ID: 0x2324, 2021.07.31 15:41:59.037, 0 ms
{"jsonrpc":"2.0","id":1067,"method":"eth_submitWork","params":["0x498d02d6204f31db","0x99687495cb50ada9db761b5a8873976905b5a1d11414b3241065d5ebc7ab715f","0x6474694985f8a5a556395eff7bef2c9c51b7968cf0f4bc0edc95d5e7950ae8e8"],"worker":"alphagruis"}

--- thread ID: 0xe6c, 2021.07.31 15:41:59.057, PCIe: 00000000:0a:00.0, GPU.08 share accepted.

>>> thread ID: 0xe6c, 2021.07.31 15:41:59.057, 3086 ms (20 ms)
{"id":1067,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2100, 2021.07.31 15:42:08.131, 9073 ms
{"id":0,"jsonrpc":"2.0","result":["0xea617b00b9a07c0c11cbfd111775169e870b029312623b3c79b9b9d51652ffa8","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff6"]}

--- thread ID: 0x2100, 2021.07.31 15:42:08.131
epoch = 220 (next epoch in 21738 blocks), share difficulty = 4 GH.

>>> thread ID: 0x1fe0, 2021.07.31 15:42:09.108, 977 ms
{"id":0,"jsonrpc":"2.0","result":["0x5aca68a3dc34b070c2a5e010275fe5987c210b64e9197a0b2b40e4f224c60cdf","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff7"]}

--- thread ID: 0x1fe0, 2021.07.31 15:42:09.108
epoch = 220 (next epoch in 21737 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:42:10.955, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:14:41.455)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:06:40.442, 38 ms], [fan = 75%, 1719 rpm, 59°C], 30.579176 MH/s (111.34 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 7, S = 0, R = 0, I = 0], [00:00:18.677, 41 ms], [fan = 75%, 1731 rpm, 60°C], 30.542764 MH/s (108.69 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 5, S = 0, R = 0, I = 0], [00:01:23.286,  0 ms], [fan = 75%, 1724 rpm, 65°C], 30.558178 MH/s (111.40 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 5, S = 0, R = 0, I = 0], [00:00:32.757,  0 ms], [fan = 75%, 1724 rpm, 58°C], 30.573032 MH/s (109.48 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 3, S = 0, R = 0, I = 0], [00:00:53.281,  0 ms], [fan = 75%, 1717 rpm, 62°C], 30.566838 MH/s (109.73 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:08:21.933,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.552624 MH/s (111.14 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:02:20.541,  0 ms], [fan = 75%, 1723 rpm, 59°C], 30.556233 MH/s (110.38 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 4, S = 0, R = 0, I = 0], [00:00:11.918,  0 ms], [fan = 75%, 1728 rpm, 59°C], 30.557615 MH/s (108.87 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 5, S = 0, R = 0, I = 0], [00:00:47.012,  0 ms], [fan = 75%, 1726 rpm, 67°C], 30.542858 MH/s (110.39 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 8, S = 0, R = 0, I = 0], [00:00:47.471,  0 ms], [fan = 75%, 1731 rpm, 65°C], 30.543894 MH/s (108.77 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:02:06.427,  0 ms], [fan = 75%, 1727 rpm, 60°C], 30.546064 MH/s (109.63 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:05:57.486,  0 ms], [fan = 75%, 1715 rpm, 64°C], 30.546585 MH/s (108.97 W) = 366.665861 MH/s (1318.78 W)

<<< thread ID: 0x1e74, 2021.07.31 15:42:11.129, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015dae085","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1f8c, 2021.07.31 15:42:11.151, 2043 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x1140, 2021.07.31 15:42:15.013, 3861 ms
{"id":0,"jsonrpc":"2.0","result":["0xb7d805c890db0242f67a2d770ee850111968742c67768ed9ba53ae327abba508","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff8"]}

--- thread ID: 0x1140, 2021.07.31 15:42:15.013
epoch = 220 (next epoch in 21736 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:42:26.150, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:14:56.650)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:06:55.636, 51 ms], [fan = 75%, 1721 rpm, 59°C], 30.576259 MH/s (110.82 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 7, S = 0, R = 0, I = 0], [00:00:33.872, 36 ms], [fan = 75%, 1710 rpm, 60°C], 30.537353 MH/s (108.24 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 5, S = 0, R = 0, I = 0], [00:01:38.480,  0 ms], [fan = 75%, 1730 rpm, 65°C], 30.558668 MH/s (111.63 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 5, S = 0, R = 0, I = 0], [00:00:47.951,  0 ms], [fan = 75%, 1741 rpm, 58°C], 30.566980 MH/s (109.57 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 3, S = 0, R = 0, I = 0], [00:01:08.475,  0 ms], [fan = 75%, 1728 rpm, 62°C], 30.563937 MH/s (109.28 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:08:37.127,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.554174 MH/s (109.32 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 7, S = 0, R = 0, I = 0], [00:02:35.735,  0 ms], [fan = 75%, 1739 rpm, 59°C], 30.553457 MH/s (108.90 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 4, S = 0, R = 0, I = 0], [00:00:27.113,  0 ms], [fan = 75%, 1728 rpm, 59°C], 30.553738 MH/s (110.99 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 5, S = 0, R = 0, I = 0], [00:01:02.207,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.537762 MH/s (109.77 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 8, S = 0, R = 0, I = 0], [00:01:02.665,  0 ms], [fan = 75%, 1725 rpm, 65°C], 30.545557 MH/s (109.65 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:02:21.621,  0 ms], [fan = 75%, 1735 rpm, 60°C], 30.544104 MH/s (110.56 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:06:12.680,  0 ms], [fan = 75%, 1735 rpm, 64°C], 30.541857 MH/s (111.35 W) = 366.633846 MH/s (1320.09 W)

<<< thread ID: 0x182c, 2021.07.31 15:42:26.367, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da6376","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x8d8, 2021.07.31 15:42:26.389, 11376 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x2b98, 2021.07.31 15:42:36.852, PCIe: 00000000:09:00.0, GPU.07 share found (search channel 0).
 nonce: 0x498d02d95ad058be
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000004827c80bca42fd809ef4615f50e70ebb160a34500df4f6f3645cc331
   mix: 0x7a8ff2db311b0a2e376f865ef1b218f243b296fa3b97f6cecaf591b14e2131f0

<<< thread ID: 0x2324, 2021.07.31 15:42:36.852, 0 ms
{"jsonrpc":"2.0","id":1068,"method":"eth_submitWork","params":["0x498d02d95ad058be","0xb7d805c890db0242f67a2d770ee850111968742c67768ed9ba53ae327abba508","0x7a8ff2db311b0a2e376f865ef1b218f243b296fa3b97f6cecaf591b14e2131f0"],"worker":"alphagruis"}

--- thread ID: 0xe6c, 2021.07.31 15:42:36.873, PCIe: 00000000:09:00.0, GPU.07 share accepted.

>>> thread ID: 0xe6c, 2021.07.31 15:42:36.873, 10484 ms (21 ms)
{"id":1068,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x2100, 2021.07.31 15:42:40.466, 3592 ms
{"id":0,"jsonrpc":"2.0","result":["0xf053615cf34c952f4f099aae65c558df7e51d1627bee8e5fa30874d684e6e385","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fff9"]}

--- thread ID: 0x2100, 2021.07.31 15:42:40.466
epoch = 220 (next epoch in 21735 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:42:41.362, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:15:11.862)
PCIe: 00000000:01:00.0, GPU.01: [A = 2, S = 0, R = 0, I = 0], [00:07:10.848, 12 ms], [fan = 75%, 1737 rpm, 59°C], 30.575030 MH/s (109.01 W) +
PCIe: 00000000:02:00.0, GPU.02: [A = 7, S = 0, R = 0, I = 0], [00:00:49.084,  0 ms], [fan = 75%, 1707 rpm, 60°C], 30.561218 MH/s (108.98 W) +
PCIe: 00000000:03:00.0, GPU.03: [A = 5, S = 0, R = 0, I = 0], [00:01:53.692,  6 ms], [fan = 75%, 1724 rpm, 65°C], 30.561762 MH/s (107.62 W) +
PCIe: 00000000:04:00.0, GPU.04: [A = 5, S = 0, R = 0, I = 0], [00:01:03.163, 19 ms], [fan = 75%, 1708 rpm, 58°C], 30.569464 MH/s (109.20 W) +
PCIe: 00000000:05:00.0, GPU.05: [A = 3, S = 0, R = 0, I = 0], [00:01:23.687,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.563325 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A = 6, S = 0, R = 0, I = 0], [00:08:52.339,  0 ms], [fan = 75%, 1715 rpm, 62°C], 30.556533 MH/s (108.69 W) +
PCIe: 00000000:09:00.0, GPU.07: [A = 8, S = 0, R = 0, I = 0], [00:00:04.510,  0 ms], [fan = 75%, 1739 rpm, 59°C], 30.552491 MH/s (108.47 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A = 4, S = 0, R = 0, I = 0], [00:00:42.325,  0 ms], [fan = 75%, 1725 rpm, 60°C], 30.553007 MH/s (109.27 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A = 5, S = 0, R = 0, I = 0], [00:01:17.419,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.545235 MH/s (108.53 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A = 8, S = 0, R = 0, I = 0], [00:01:17.877,  0 ms], [fan = 75%, 1719 rpm, 65°C], 30.544102 MH/s (109.56 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 9, S = 0, R = 0, I = 0], [00:02:36.833,  0 ms], [fan = 75%, 1709 rpm, 60°C], 30.545127 MH/s (110.17 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A = 6, S = 0, R = 0, I = 0], [00:06:27.892,  0 ms], [fan = 75%, 1715 rpm, 64°C], 30.543794 MH/s (111.02 W) = 366.671088 MH/s (1310.39 W)

<<< thread ID: 0x1fe0, 2021.07.31 15:42:41.471, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015daf4f0","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1e74, 2021.07.31 15:42:41.493, 1026 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1ae8, 2021.07.31 15:42:44.141, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 1).
 nonce: 0x498d02d9fa2301f4
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000d66830058f9a848b9533f39d0b38c3a212a9fef634eacbaa410fef82
   mix: 0x098e35d14da9513f38f0da17f3cd3c8262a140b745aadeafd0e2f84882e58dcf

<<< thread ID: 0x1f8c, 2021.07.31 15:42:44.141, 0 ms
{"jsonrpc":"2.0","id":1069,"method":"eth_submitWork","params":["0x498d02d9fa2301f4","0xf053615cf34c952f4f099aae65c558df7e51d1627bee8e5fa30874d684e6e385","0x098e35d14da9513f38f0da17f3cd3c8262a140b745aadeafd0e2f84882e58dcf"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:42:44.163, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:42:44.163, 2669 ms (21 ms)
{"id":1069,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:42:56.464, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:15:26.965)
PCIe: 00000000:01:00.0, GPU.01: [A =  2, S = 0, R = 0, I = 0], [00:07:25.951,  2 ms], [fan = 75%, 1713 rpm, 59°C], 30.578287 MH/s (107.81 W) +
PCIe: 00000000:02:00.0, GPU.02: [A =  7, S = 0, R = 0, I = 0], [00:01:04.187, 41 ms], [fan = 75%, 1715 rpm, 60°C], 30.564590 MH/s (111.09 W) +
PCIe: 00000000:03:00.0, GPU.03: [A =  5, S = 0, R = 0, I = 0], [00:02:08.795, 57 ms], [fan = 75%, 1722 rpm, 65°C], 30.564876 MH/s (109.12 W) +
PCIe: 00000000:04:00.0, GPU.04: [A =  5, S = 0, R = 0, I = 0], [00:01:18.266,  7 ms], [fan = 75%, 1730 rpm, 58°C], 30.575656 MH/s (110.44 W) +
PCIe: 00000000:05:00.0, GPU.05: [A =  3, S = 0, R = 0, I = 0], [00:01:38.790, 21 ms], [fan = 75%, 1717 rpm, 62°C], 30.538737 MH/s (109.97 W) +
PCIe: 00000000:06:00.0, GPU.06: [A =  6, S = 0, R = 0, I = 0], [00:09:07.442,  0 ms], [fan = 75%, 1717 rpm, 62°C], 30.554838 MH/s (109.44 W) +
PCIe: 00000000:09:00.0, GPU.07: [A =  8, S = 0, R = 0, I = 0], [00:00:19.613,  8 ms], [fan = 75%, 1736 rpm, 59°C], 30.532288 MH/s (108.35 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A =  4, S = 0, R = 0, I = 0], [00:00:57.428,  0 ms], [fan = 75%, 1731 rpm, 59°C], 30.549136 MH/s (109.44 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A =  5, S = 0, R = 0, I = 0], [00:01:32.521,  0 ms], [fan = 75%, 1724 rpm, 67°C], 30.536733 MH/s (109.45 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A =  8, S = 0, R = 0, I = 0], [00:01:32.980,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.546836 MH/s (111.18 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 10, S = 0, R = 0, I = 0], [00:00:12.323,  0 ms], [fan = 75%, 1724 rpm, 60°C], 30.532181 MH/s (109.85 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A =  6, S = 0, R = 0, I = 0], [00:06:42.995,  0 ms], [fan = 75%, 1718 rpm, 64°C], 30.550489 MH/s (109.49 W) = 366.624647 MH/s (1315.66 W)

<<< thread ID: 0x182c, 2021.07.31 15:42:56.618, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015da3f87","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x8d8, 2021.07.31 15:42:56.642, 12478 ms (23 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xee0, 2021.07.31 15:42:57.454, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 1).
 nonce: 0x498d02db1cdb1704
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000b8a44dff3c131555a156f45d480a9f1d118040b0eecf1ff769bd6e15
   mix: 0xe5f56f9185f6e46e60024f92d6531a39c97490f3e85b59787fa8fea17dee62ca

<<< thread ID: 0x2324, 2021.07.31 15:42:57.454, 0 ms
{"jsonrpc":"2.0","id":1070,"method":"eth_submitWork","params":["0x498d02db1cdb1704","0xf053615cf34c952f4f099aae65c558df7e51d1627bee8e5fa30874d684e6e385","0xe5f56f9185f6e46e60024f92d6531a39c97490f3e85b59787fa8fea17dee62ca"],"worker":"alphagruis"}

--- thread ID: 0xe6c, 2021.07.31 15:42:57.478, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0xe6c, 2021.07.31 15:42:57.478, 836 ms (24 ms)
{"id":1070,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:43:11.612, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:15:42.112)
PCIe: 00000000:01:00.0, GPU.01: [A =  2, S = 0, R = 0, I = 0], [00:07:41.099, 33 ms], [fan = 75%, 1731 rpm, 59°C], 30.570625 MH/s (109.25 W) +
PCIe: 00000000:02:00.0, GPU.02: [A =  8, S = 0, R = 0, I = 0], [00:00:14.158,  0 ms], [fan = 75%, 1733 rpm, 59°C], 30.560239 MH/s (109.20 W) +
PCIe: 00000000:03:00.0, GPU.03: [A =  5, S = 0, R = 0, I = 0], [00:02:23.942, 11 ms], [fan = 75%, 1719 rpm, 65°C], 30.544507 MH/s (111.16 W) +
PCIe: 00000000:04:00.0, GPU.04: [A =  5, S = 0, R = 0, I = 0], [00:01:33.413,  0 ms], [fan = 75%, 1733 rpm, 59°C], 30.560971 MH/s (110.26 W) +
PCIe: 00000000:05:00.0, GPU.05: [A =  3, S = 0, R = 0, I = 0], [00:01:53.937,  0 ms], [fan = 75%, 1722 rpm, 62°C], 30.563013 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A =  6, S = 0, R = 0, I = 0], [00:09:22.589,  0 ms], [fan = 75%, 1732 rpm, 62°C], 30.543384 MH/s (109.02 W) +
PCIe: 00000000:09:00.0, GPU.07: [A =  8, S = 0, R = 0, I = 0], [00:00:34.760,  0 ms], [fan = 75%, 1728 rpm, 59°C], 30.553515 MH/s (108.61 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A =  4, S = 0, R = 0, I = 0], [00:01:12.575,  0 ms], [fan = 75%, 1720 rpm, 59°C], 30.539532 MH/s (108.78 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A =  5, S = 0, R = 0, I = 0], [00:01:47.669,  0 ms], [fan = 75%, 1721 rpm, 67°C], 30.534119 MH/s (109.45 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A =  8, S = 0, R = 0, I = 0], [00:01:48.127,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.543245 MH/s (110.32 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 10, S = 0, R = 0, I = 0], [00:00:27.471,  0 ms], [fan = 75%, 1740 rpm, 60°C], 30.544851 MH/s (110.75 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A =  6, S = 0, R = 0, I = 0], [00:06:58.142,  0 ms], [fan = 75%, 1735 rpm, 64°C], 30.539476 MH/s (109.72 W) = 366.597477 MH/s (1316.42 W)

<<< thread ID: 0x2100, 2021.07.31 15:43:11.794, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d9d565","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x1fe0, 2021.07.31 15:43:11.816, 14337 ms (21 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0xa50, 2021.07.31 15:43:26.858, PCIe: 00000000:03:00.0, GPU.03 share found (search channel 0).
 nonce: 0x498d02dd9f6c627a
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x0000000100ee07f4e78ce923faa2ad5ec5c898acac93672813ee1e8f853c14af
   mix: 0xe5b2c6eb8ada400447a7228b883c8b3e8a2f46589a01d88463ffff414e355493

<<< thread ID: 0x1e74, 2021.07.31 15:43:26.858, 0 ms
{"jsonrpc":"2.0","id":1071,"method":"eth_submitWork","params":["0x498d02dd9f6c627a","0xf053615cf34c952f4f099aae65c558df7e51d1627bee8e5fa30874d684e6e385","0xe5b2c6eb8ada400447a7228b883c8b3e8a2f46589a01d88463ffff414e355493"],"worker":"alphagruis"}

--- thread ID: 0x1f8c, 2021.07.31 15:43:26.880, PCIe: 00000000:03:00.0, GPU.03 share accepted.

>>> thread ID: 0x1f8c, 2021.07.31 15:43:26.880, 15064 ms (21 ms)
{"id":1071,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:43:26.797, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:15:57.298)
PCIe: 00000000:01:00.0, GPU.01: [A =  2, S = 0, R = 0, I = 0], [00:07:56.284, 36 ms], [fan = 75%, 1718 rpm, 59°C], 30.574205 MH/s (109.04 W) +
PCIe: 00000000:02:00.0, GPU.02: [A =  8, S = 0, R = 0, I = 0], [00:00:29.343,  0 ms], [fan = 75%, 1733 rpm, 59°C], 30.565159 MH/s (109.27 W) +
PCIe: 00000000:03:00.0, GPU.03: [A =  5, S = 0, R = 0, I = 0], [00:02:39.128,  7 ms], [fan = 75%, 1724 rpm, 65°C], 30.560668 MH/s (108.06 W) +
PCIe: 00000000:04:00.0, GPU.04: [A =  5, S = 0, R = 0, I = 0], [00:01:48.599,  0 ms], [fan = 75%, 1713 rpm, 59°C], 30.569091 MH/s (110.38 W) +
PCIe: 00000000:05:00.0, GPU.05: [A =  3, S = 0, R = 0, I = 0], [00:02:09.123,  0 ms], [fan = 75%, 1725 rpm, 62°C], 30.561801 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A =  6, S = 0, R = 0, I = 0], [00:09:37.775,  0 ms], [fan = 75%, 1732 rpm, 62°C], 30.549961 MH/s (110.49 W) +
PCIe: 00000000:09:00.0, GPU.07: [A =  8, S = 0, R = 0, I = 0], [00:00:49.946,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.556152 MH/s (111.26 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A =  4, S = 0, R = 0, I = 0], [00:01:27.761,  0 ms], [fan = 75%, 1728 rpm, 59°C], 30.551226 MH/s (109.67 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A =  5, S = 0, R = 0, I = 0], [00:02:02.854,  0 ms], [fan = 75%, 1729 rpm, 67°C], 30.546101 MH/s (110.50 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A =  8, S = 0, R = 0, I = 0], [00:02:03.313,  0 ms], [fan = 75%, 1722 rpm, 65°C], 30.543040 MH/s (109.70 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 10, S = 0, R = 0, I = 0], [00:00:42.656,  0 ms], [fan = 75%, 1735 rpm, 60°C], 30.544327 MH/s (107.41 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A =  6, S = 0, R = 0, I = 0], [00:07:13.328,  0 ms], [fan = 75%, 1732 rpm, 64°C], 30.544839 MH/s (109.72 W) = 366.666570 MH/s (1315.39 W)

<<< thread ID: 0x1140, 2021.07.31 15:43:26.942, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015dae34a","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x182c, 2021.07.31 15:43:26.963, 82 ms (20 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1aa8, 2021.07.31 15:43:27.053, PCIe: 00000000:0c:00.0, GPU.09 share found (search channel 0).
 nonce: 0x498d02dda3b0fb8f
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000001867d6f625ff6c6c01b962d96b59226349dc90bfa5fb63deedbeabae
   mix: 0x28f1d68bb667ec2b9aac9da9e290284999c61b4f25dc4231320c6ab5bce660cb

<<< thread ID: 0x8d8, 2021.07.31 15:43:27.053, 0 ms
{"jsonrpc":"2.0","id":1072,"method":"eth_submitWork","params":["0x498d02dda3b0fb8f","0xf053615cf34c952f4f099aae65c558df7e51d1627bee8e5fa30874d684e6e385","0x28f1d68bb667ec2b9aac9da9e290284999c61b4f25dc4231320c6ab5bce660cb"],"worker":"alphagruis"}

--- thread ID: 0x2324, 2021.07.31 15:43:27.075, PCIe: 00000000:0c:00.0, GPU.09 share accepted.

>>> thread ID: 0x2324, 2021.07.31 15:43:27.075, 111 ms (21 ms)
{"id":1072,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1eb4, 2021.07.31 15:43:41.955, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:16:12.455)
PCIe: 00000000:01:00.0, GPU.01: [A =  2, S = 0, R = 0, I = 0], [00:08:11.442, 4 ms], [fan = 75%, 1724 rpm, 59°C], 30.554746 MH/s (109.27 W) +
PCIe: 00000000:02:00.0, GPU.02: [A =  8, S = 0, R = 0, I = 0], [00:00:44.501, 8 ms], [fan = 75%, 1707 rpm, 59°C], 30.476714 MH/s (108.43 W) +
PCIe: 00000000:03:00.0, GPU.03: [A =  6, S = 0, R = 0, I = 0], [00:00:15.097, 0 ms], [fan = 75%, 1714 rpm, 65°C], 30.531588 MH/s (107.82 W) +
PCIe: 00000000:04:00.0, GPU.04: [A =  5, S = 0, R = 0, I = 0], [00:02:03.757, 0 ms], [fan = 75%, 1727 rpm, 59°C], 30.552625 MH/s (110.43 W) +
PCIe: 00000000:05:00.0, GPU.05: [A =  3, S = 0, R = 0, I = 0], [00:02:24.281, 0 ms], [fan = 75%, 1728 rpm, 62°C], 30.543945 MH/s (109.55 W) +
PCIe: 00000000:06:00.0, GPU.06: [A =  6, S = 0, R = 0, I = 0], [00:09:52.933, 0 ms], [fan = 75%, 1723 rpm, 62°C], 30.462081 MH/s (109.36 W) +
PCIe: 00000000:09:00.0, GPU.07: [A =  8, S = 0, R = 0, I = 0], [00:01:05.103, 0 ms], [fan = 75%, 1731 rpm, 59°C], 30.554467 MH/s (108.70 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A =  4, S = 0, R = 0, I = 0], [00:01:42.919, 0 ms], [fan = 75%, 1723 rpm, 59°C], 30.547901 MH/s (109.53 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A =  6, S = 0, R = 0, I = 0], [00:00:14.902, 0 ms], [fan = 75%, 1724 rpm, 67°C], 30.529550 MH/s (108.05 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A =  8, S = 0, R = 0, I = 0], [00:02:18.471, 0 ms], [fan = 75%, 1733 rpm, 65°C], 30.463712 MH/s (109.56 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 10, S = 0, R = 0, I = 0], [00:00:57.814, 0 ms], [fan = 75%, 1732 rpm, 60°C], 30.511648 MH/s (109.77 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A =  6, S = 0, R = 0, I = 0], [00:07:28.486, 0 ms], [fan = 75%, 1715 rpm, 64°C], 30.515972 MH/s (110.42 W) = 366.244949 MH/s (1310.89 W)

<<< thread ID: 0xe6c, 2021.07.31 15:43:42.189, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d47455","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

--- thread ID: 0xf60, 2021.07.31 15:43:42.243, PCIe: 00000000:0a:00.0, GPU.08 share found (search channel 0).
 nonce: 0x498d02deef8b148c
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000c719c5fae8362018c6efd88c2eab50df797156eeed11341ec1214468
   mix: 0x08bac406428a5b3b7a289d6a275aca1ae8281a5169b4d6fc09f51e2877e40480

<<< thread ID: 0x2100, 2021.07.31 15:43:42.243, 0 ms
{"jsonrpc":"2.0","id":1073,"method":"eth_submitWork","params":["0x498d02deef8b148c","0xf053615cf34c952f4f099aae65c558df7e51d1627bee8e5fa30874d684e6e385","0x08bac406428a5b3b7a289d6a275aca1ae8281a5169b4d6fc09f51e2877e40480"],"worker":"alphagruis"}

>>> thread ID: 0x1fe0, 2021.07.31 15:43:42.467, 15392 ms (278 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1e74, 2021.07.31 15:43:42.488, PCIe: 00000000:0a:00.0, GPU.08 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:43:42.488, 21 ms (245 ms)
{"id":1073,"jsonrpc":"2.0","result":true}

--- thread ID: 0x20d8, 2021.07.31 15:43:47.862, PCIe: 00000000:04:00.0, GPU.04 share found (search channel 1).
 nonce: 0x498d02df69f416c3
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000ae4f8ca271fb591d0cff773401e3ddd826941cfa8642337a82aca1c1
   mix: 0x2af10b1d7f4fcef1ad26de293522389a44bf871fe74463d1360605f5daa6a64d

<<< thread ID: 0x1f8c, 2021.07.31 15:43:47.862, 0 ms
{"jsonrpc":"2.0","id":1074,"method":"eth_submitWork","params":["0x498d02df69f416c3","0xf053615cf34c952f4f099aae65c558df7e51d1627bee8e5fa30874d684e6e385","0x2af10b1d7f4fcef1ad26de293522389a44bf871fe74463d1360605f5daa6a64d"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:43:47.886, PCIe: 00000000:04:00.0, GPU.04 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:43:47.886, 5397 ms (23 ms)
{"id":1074,"jsonrpc":"2.0","result":true}

>>> thread ID: 0x182c, 2021.07.31 15:43:52.867, 4981 ms
{"id":0,"jsonrpc":"2.0","result":["0xf3535fba4bceef431ebcac7c7ca932e7d0874b04b6e0d66d7a34a7c11eef087b","0x3c19273e1bfdb99395769315d6b8c31dbb56417f0b83f3374c806fd18b726e71","0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba","0xc9fffa"]}

--- thread ID: 0x182c, 2021.07.31 15:43:52.867
epoch = 220 (next epoch in 21734 blocks), share difficulty = 4 GH.

--- thread ID: 0x1eb4, 2021.07.31 15:43:57.189, asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:16:27.689)
PCIe: 00000000:01:00.0, GPU.01: [A =  2, S = 0, R = 0, I = 0], [00:08:26.676, 48 ms], [fan = 75%, 1734 rpm, 59°C], 30.563852 MH/s (109.25 W) +
PCIe: 00000000:02:00.0, GPU.02: [A =  8, S = 0, R = 0, I = 0], [00:00:59.735, 33 ms], [fan = 75%, 1728 rpm, 59°C], 30.525020 MH/s (109.41 W) +
PCIe: 00000000:03:00.0, GPU.03: [A =  6, S = 0, R = 0, I = 0], [00:00:30.330,  0 ms], [fan = 75%, 1711 rpm, 65°C], 30.550411 MH/s (109.71 W) +
PCIe: 00000000:04:00.0, GPU.04: [A =  6, S = 0, R = 0, I = 0], [00:00:09.326,  0 ms], [fan = 75%, 1713 rpm, 59°C], 30.561871 MH/s (109.77 W) +
PCIe: 00000000:05:00.0, GPU.05: [A =  3, S = 0, R = 0, I = 0], [00:02:39.514,  0 ms], [fan = 75%, 1712 rpm, 62°C], 30.556894 MH/s (109.88 W) +
PCIe: 00000000:06:00.0, GPU.06: [A =  6, S = 0, R = 0, I = 0], [00:10:08.166,  0 ms], [fan = 75%, 1720 rpm, 62°C], 30.525081 MH/s (109.11 W) +
PCIe: 00000000:09:00.0, GPU.07: [A =  8, S = 0, R = 0, I = 0], [00:01:20.337,  0 ms], [fan = 75%, 1715 rpm, 59°C], 30.531351 MH/s (111.11 W) +
PCIe: 00000000:0a:00.0, GPU.08: [A =  5, S = 0, R = 0, I = 0], [00:00:14.946,  0 ms], [fan = 75%, 1725 rpm, 59°C], 30.529634 MH/s (109.20 W) +
PCIe: 00000000:0c:00.0, GPU.09: [A =  6, S = 0, R = 0, I = 0], [00:00:30.136,  0 ms], [fan = 75%, 1732 rpm, 67°C], 30.536313 MH/s (110.39 W) +
PCIe: 00000000:0d:00.0, GPU.10: [A =  8, S = 0, R = 0, I = 0], [00:02:33.704,  0 ms], [fan = 75%, 1716 rpm, 65°C], 30.525096 MH/s (109.44 W) +
PCIe: 00000000:0e:00.0, GPU.11: [A = 10, S = 0, R = 0, I = 0], [00:01:13.048,  0 ms], [fan = 75%, 1728 rpm, 60°C], 30.538955 MH/s (107.89 W) +
PCIe: 00000000:0f:00.0, GPU.12: [A =  6, S = 0, R = 0, I = 0], [00:07:43.719,  0 ms], [fan = 75%, 1718 rpm, 64°C], 30.537363 MH/s (109.49 W) = 366.481841 MH/s (1314.65 W)

<<< thread ID: 0x8d8, 2021.07.31 15:43:57.361, 0 ms
{"jsonrpc":"2.0","id":13,"method":"eth_submitHashrate","params":["0x0000000000000000000000000000000000000000000000000000000015d811b1","0x800eb3779a98f40c1ee5028cd04f8d5d6a3e639a3951ac5144a543d286176a88"],"worker":"alphagruis"}

>>> thread ID: 0x2324, 2021.07.31 15:43:57.384, 4516 ms (22 ms)
{"id":13,"jsonrpc":"2.0","result":true}

--- thread ID: 0x1ae8, 2021.07.31 15:43:59.123, PCIe: 00000000:0e:00.0, GPU.11 share found (search channel 0).
 nonce: 0x498d02e06003ecc2
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x00000000b3791001019ce65016cd8209026db1aa8f69fdb66ab2d641b2c6b3d2
   mix: 0x6493599149479defb0cbd58e31ac844a609f736bb0e7412009adaa76848a5d60

<<< thread ID: 0xe6c, 2021.07.31 15:43:59.123, 0 ms
{"jsonrpc":"2.0","id":1075,"method":"eth_submitWork","params":["0x498d02e06003ecc2","0xf3535fba4bceef431ebcac7c7ca932e7d0874b04b6e0d66d7a34a7c11eef087b","0x6493599149479defb0cbd58e31ac844a609f736bb0e7412009adaa76848a5d60"],"worker":"alphagruis"}

--- thread ID: 0x2100, 2021.07.31 15:43:59.145, PCIe: 00000000:0e:00.0, GPU.11 share accepted.

>>> thread ID: 0x2100, 2021.07.31 15:43:59.145, 1761 ms (21 ms)
{"id":1075,"jsonrpc":"2.0","result":true}

--- thread ID: 0xee0, 2021.07.31 15:43:59.632, PCIe: 00000000:02:00.0, GPU.02 share found (search channel 0).
 nonce: 0x498d02e06b2a2841
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000002df912acf2d28aa67bc7be70e178fe719ac436790935530b5a6089d3
   mix: 0x3f9fb8784ebded8c8e06f740fff69ffc513fef262d97daa592994b35814b02aa

<<< thread ID: 0x1fe0, 2021.07.31 15:43:59.633, 0 ms
{"jsonrpc":"2.0","id":1076,"method":"eth_submitWork","params":["0x498d02e06b2a2841","0xf3535fba4bceef431ebcac7c7ca932e7d0874b04b6e0d66d7a34a7c11eef087b","0x3f9fb8784ebded8c8e06f740fff69ffc513fef262d97daa592994b35814b02aa"],"worker":"alphagruis"}

--- thread ID: 0x1e74, 2021.07.31 15:43:59.655, PCIe: 00000000:02:00.0, GPU.02 share accepted.

>>> thread ID: 0x1e74, 2021.07.31 15:43:59.655, 509 ms (22 ms)
{"id":1076,"jsonrpc":"2.0","result":true}

--- thread ID: 0xa50, 2021.07.31 15:44:05.922, PCIe: 00000000:03:00.0, GPU.03 share found (search channel 0).
 nonce: 0x498d02e0f4814235
target: 0x0000000112e0be826d694b2e62d01511f12a6061fbaec8bc02357593e70e52ba
result: 0x000000008e323f1f3009ce0c53dc792b98654e4432d97e853766363c52369363
   mix: 0x96c46b884aaae23a51e5388e532bbc67e1922c9866ee83a84a476ca7cc10ee78

<<< thread ID: 0x1f8c, 2021.07.31 15:44:05.922, 0 ms
{"jsonrpc":"2.0","id":1077,"method":"eth_submitWork","params":["0x498d02e0f4814235","0xf3535fba4bceef431ebcac7c7ca932e7d0874b04b6e0d66d7a34a7c11eef087b","0x96c46b884aaae23a51e5388e532bbc67e1922c9866ee83a84a476ca7cc10ee78"],"worker":"alphagruis"}

--- thread ID: 0x1140, 2021.07.31 15:44:05.945, PCIe: 00000000:03:00.0, GPU.03 share accepted.

>>> thread ID: 0x1140, 2021.07.31 15:44:05.945, 6290 ms (22 ms)
{"id":1077,"jsonrpc":"2.0","result":true}

quitting...

--- thread ID: 0xe48, 2021.07.31 15:44:07.348
disconnected from asia1-etc.ethermine.org:5555 (172.65.253.203:5555 TLSv1.2, 00:16:37.849)

--- thread ID: 0x11d8, 2021.07.31 15:44:07.741
PCIe: 00000000:05:00.0, GPU.05: exit thread.

--- thread ID: 0x120c, 2021.07.31 15:44:07.776
PCIe: 00000000:06:00.0, GPU.06: exit thread.

--- thread ID: 0xf60, 2021.07.31 15:44:07.844
PCIe: 00000000:0a:00.0, GPU.08: exit thread.

--- thread ID: 0xa50, 2021.07.31 15:44:07.937
PCIe: 00000000:03:00.0, GPU.03: exit thread.

--- thread ID: 0x20d8, 2021.07.31 15:44:07.968
PCIe: 00000000:04:00.0, GPU.04: exit thread.

--- thread ID: 0xee0, 2021.07.31 15:44:08.017
PCIe: 00000000:02:00.0, GPU.02: exit thread.

--- thread ID: 0x2b98, 2021.07.31 15:44:08.048
PCIe: 00000000:09:00.0, GPU.07: exit thread.

--- thread ID: 0x1ae8, 2021.07.31 15:44:08.090
PCIe: 00000000:0e:00.0, GPU.11: exit thread.

--- thread ID: 0xd20, 2021.07.31 15:44:08.105
PCIe: 00000000:0d:00.0, GPU.10: exit thread.

--- thread ID: 0x2aac, 2021.07.31 15:44:08.183
PCIe: 00000000:0f:00.0, GPU.12: exit thread.

--- thread ID: 0x7d4, 2021.07.31 15:44:08.188
PCIe: 00000000:01:00.0, GPU.01: exit thread.

--- thread ID: 0x1aa8, 2021.07.31 15:44:08.188
PCIe: 00000000:0c:00.0, GPU.09: exit thread.
```

</p>
</details>
