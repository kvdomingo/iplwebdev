import React from 'react';
import { Image } from 'cloudinary-react';


export default function App() {
    return (
        <div className='Container'>
            <div className='App'>
                <Image
                    cloudName='kdphotography-assets'
                    className='Logo'
                    publicId='ipl/IPL_Logo'
                    responsive
                    responsiveUseBreakpoints
                    width='auto'
                    dpr='auto'
                    crop='scale'
                    />
                <h1>Coming soon</h1>
            </div>
        </div>
    );
}
