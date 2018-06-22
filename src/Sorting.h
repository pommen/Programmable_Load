int sorting(int buf[]){
        for(int i=0; i<9; i++) //sort the analog from small to large
        {
                for(int j=i+1; j<20; j++)
                {
                        if(buf[i]>buf[j])
                        {
                                int temp=buf[i];
                                buf[i]=buf[j];
                                buf[j]=temp;
                        }
                }
                //Serial.println(buf[i]);

        }
        int avgValue=0;
        for(int i=3; i<6; i++) { //take the average value of 6 center sample
                avgValue+=buf[i];
                //  Serial.println(i);
        }
        return avgValue;
}
